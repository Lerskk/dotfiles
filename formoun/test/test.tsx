import React, { useState, useEffect, useCallback, useRef } from "react";

// Types and interfaces
interface User {
  id: string;
  name: string;
  email: string;
  role: "admin" | "user" | "guest";
  preferences: UserPreferences;
}

interface UserPreferences {
  theme: "light" | "dark" | "system";
  notifications: boolean;
  language: string;
}

type SortDirection = "asc" | "desc";
type Status = "idle" | "loading" | "success" | "error";

// Generic hook
function useLocalStorage<T>(key: string, initialValue: T) {
  const [value, setValue] = useState<T>(() => {
    try {
      const item = window.localStorage.getItem(key);
      return item ? (JSON.parse(item) as T) : initialValue;
    } catch {
      return initialValue;
    }
  });

  useEffect(() => {
    window.localStorage.setItem(key, JSON.stringify(value));
  }, [key, value]);

  return [value, setValue] as const;
}

// Custom hook for API calls
function useFetch<T>(url: string) {
  const [data, setData] = useState<T | null>(null);
  const [status, setStatus] = useState<Status>("idle");
  const [error, setError] = useState<string | null>(null);

  const fetchData = useCallback(async () => {
    setStatus("loading");
    try {
      const response = await fetch(url);
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const json = (await response.json()) as T;
      setData(json);
      setStatus("success");
    } catch (err) {
      setError(err instanceof Error ? err.message : "Unknown error");
      setStatus("error");
    }
  }, [url]);

  useEffect(() => {
    void fetchData();
  }, [fetchData]);

  return { data, status, error, refetch: fetchData };
}

// Components
const Badge: React.FC<{ role: User["role"] }> = ({ role }) => {
  const colors: Record<User["role"], string> = {
    admin: "bg-purple-500/20 text-purple-300",
    user: "bg-blue-500/20 text-blue-300",
    guest: "bg-gray-500/20 text-gray-300",
  };

  return (
    <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${colors[role]}`}>
      {role}
    </span>
  );
};

const UserRow: React.FC<{
  user: User;
  onSelect: (id: string) => void;
  isSelected: boolean;
}> = ({ user, onSelect, isSelected }) => {
  return (
    <tr
      className={`cursor-pointer transition-colors ${
        isSelected ? "bg-blue-500/10" : "hover:bg-white/5"
      }`}
      onClick={() => onSelect(user.id)}
    >
      <td className="px-4 py-3 text-sm">{user.name}</td>
      <td className="px-4 py-3 text-sm text-muted">{user.email}</td>
      <td className="px-4 py-3 text-sm">
        <Badge role={user.role} />
      </td>
      <td className="px-4 py-3 text-sm">{user.preferences.theme}</td>
    </tr>
  );
};

const SortButton: React.FC<{
  label: string;
  direction: SortDirection | null;
  onToggle: () => void;
}> = ({ label, direction, onToggle }) => {
  const arrow = direction === "asc" ? "↑" : direction === "desc" ? "↓" : "";
  return (
    <button
      onClick={onToggle}
      className="flex items-center gap-1 text-xs uppercase tracking-wider text-muted hover:text-white transition-colors"
    >
      {label}
      <span className="text-[10px]">{arrow}</span>
    </button>
  );
};

// Main component
export default function UserDashboard() {
  const [users, setUsers] = useLocalStorage<User[]>("users", []);
  const [selectedIds, setSelectedIds] = useLocalStorage<Set<string>>(
    "selected",
    new Set()
  );
  const [sortDir, setSortDir] = useState<SortDirection>("asc");
  const [searchQuery, setSearchQuery] = useState("");
  const inputRef = useRef<HTMLInputElement>(null);

  const { data, status, refetch } = useFetch<User[]>(
    "https://jsonplaceholder.typicode.com/users"
  );

  useEffect(() => {
    if (data) {
      const mapped: User[] = data.map((u) => ({
        ...u,
        role: "user" as const,
        preferences: {
          theme: "dark" as const,
          notifications: true,
          language: "en",
        },
      }));
      setUsers(mapped);
    }
  }, [data, setUsers]);

  const toggleSelect = useCallback(
    (id: string) => {
      setSelectedIds((prev) => {
        const next = new Set(prev);
        if (next.has(id)) {
          next.delete(id);
        } else {
          next.add(id);
        }
        return next;
      });
    },
    [setSelectedIds]
  );

  const filteredUsers = users
    .filter(
      (u) =>
        u.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        u.email.toLowerCase().includes(searchQuery.toLowerCase())
    )
    .sort((a, b) => {
      const cmp = a.name.localeCompare(b.name);
      return sortDir === "asc" ? cmp : -cmp;
    });

  const allSelected = filteredUsers.length > 0 && filteredUsers.every((u) => selectedIds.has(u.id));

  return (
    <div className="min-h-screen bg-base p-8">
      <div className="max-w-4xl mx-auto">
        <header className="mb-8">
          <h1 className="text-2xl font-bold text-white">User Dashboard</h1>
          <p className="text-muted mt-1">
            {users.length} users loaded
          </p>
        </header>

        {/* Toolbar */}
        <div className="flex items-center gap-4 mb-6">
          <input
            ref={inputRef}
            type="text"
            placeholder="Search users..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="flex-1 bg-surface0 text-text px-4 py-2 rounded-lg border border-surface1 focus:border-blue focus:outline-none"
          />
          <SortButton
            label="Name"
            direction={sortDir}
            onToggle={() => setSortDir((d) => (d === "asc" ? "desc" : "asc"))}
          />
          <button
            onClick={() => void refetch()}
            className="px-4 py-2 bg-blue text-white rounded-lg text-sm font-medium hover:bg-blue/80 transition-colors"
          >
            Refresh
          </button>
        </div>

        {/* Status */}
        {status === "loading" && (
          <div className="text-center py-12 text-muted">Loading users...</div>
        )}
        {status === "error" && (
          <div className="text-center py-12 text-red">Failed to load users</div>
        )}

        {/* Table */}
        {status === "success" && (
          <div className="border border-surface1 rounded-lg overflow-hidden">
            <table className="w-full">
              <thead className="bg-surface0">
                <tr>
                  <th className="px-4 py-3 text-left">
                    <input
                      type="checkbox"
                      checked={allSelected}
                      onChange={() => {
                        if (allSelected) {
                          setSelectedIds(new Set());
                        } else {
                          setSelectedIds(new Set(filteredUsers.map((u) => u.id)));
                        }
                      }}
                    />
                  </th>
                  <th className="px-4 py-3 text-left text-xs uppercase tracking-wider text-muted">
                    Name
                  </th>
                  <th className="px-4 py-3 text-left text-xs uppercase tracking-wider text-muted">
                    Email
                  </th>
                  <th className="px-4 py-3 text-left text-xs uppercase tracking-wider text-muted">
                    Role
                  </th>
                  <th className="px-4 py-3 text-left text-xs uppercase tracking-wider text-muted">
                    Theme
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-surface1">
                {filteredUsers.map((user) => (
                  <UserRow
                    key={user.id}
                    user={user}
                    onSelect={toggleSelect}
                    isSelected={selectedIds.has(user.id)}
                  />
                ))}
              </tbody>
            </table>
          </div>
        )}

        {/* Selected count */}
        {selectedIds.size > 0 && (
          <div className="mt-4 text-sm text-muted">
            {selectedIds.size} user{selectedIds.size !== 1 ? "s" : ""} selected
          </div>
        )}
      </div>
    </div>
  );
}
