import bpy
from bpy.types import Panel

from .modifiers_ui import modifiers_ui_with_list, modifiers_ui_with_stack
from .ui_common import pin_object_button
from .vertex_groups_ui import vertex_groups_ui
from ..utils import get_ml_active_object, object_type_has_modifiers


class BasePanel:
    bl_space_type = 'VIEW_3D'
    bl_region_type = 'UI'
    bl_category = "Modifier List"


class VIEW3D_PT_ml_modifiers(Panel, BasePanel):
    # A leading space in the label, so there's separation between it
    # and the pin button
    bl_label = " Modifiers"

    @classmethod
    def poll(cls, context):
        prefs = bpy.context.preferences.addons["modifier_list"].preferences

        if not prefs.use_sidebar:
            return False

        if prefs.keep_sidebar_visible:
            return True

        ob = get_ml_active_object()
        if ob is not None:
            return object_type_has_modifiers(ob)

        return False

    def draw_header(self, context):
        layout = self.layout
        pin_object_button(context, layout)

    def draw(self, context):
        layout = self.layout

        ob = get_ml_active_object()
        prefs = bpy.context.preferences.addons["modifier_list"].preferences

        if not ob:
            layout.label(text="No active object")
        elif not object_type_has_modifiers(ob):
            layout.label(text="Wrong object type")
        else:
            if prefs.sidebar_style == 'LIST':
                modifiers_ui_with_list(context, layout)
            else:
                modifiers_ui_with_stack(context, layout)


class VIEW3D_PT_ml_vertex_groups(Panel, BasePanel):
    bl_label = "Vertex Groups"
    bl_options = {'DEFAULT_CLOSED'}

    @classmethod
    def poll(cls, context):
        prefs = bpy.context.preferences.addons["modifier_list"].preferences

        if not prefs.use_sidebar:
            return False

        ob = get_ml_active_object()
        if ob is not None:
            return ob.type in {'MESH', 'LATTICE'}

        return False

    def draw(self, context):
        layout = self.layout
        vertex_groups_ui(context, layout)


def update_sidebar_category():
    bpy.utils.unregister_class(VIEW3D_PT_ml_modifiers)
    bpy.utils.unregister_class(VIEW3D_PT_ml_vertex_groups)

    category = bpy.context.preferences.addons["modifier_list"].preferences.sidebar_category
    VIEW3D_PT_ml_modifiers.bl_category = category
    VIEW3D_PT_ml_vertex_groups.bl_category = category

    bpy.utils.register_class(VIEW3D_PT_ml_modifiers)
    bpy.utils.register_class(VIEW3D_PT_ml_vertex_groups)


def register():
    update_sidebar_category()
