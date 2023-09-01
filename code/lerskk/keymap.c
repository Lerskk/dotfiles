#include QMK_KEYBOARD_H
// #include "features/achordion.h"

#define HOME_A LGUI_T(KC_A)
#define HOME_O LALT_T(KC_O)
#define HOME_E LSFT_T(KC_E)
#define HOME_U LCTL_T(KC_U)
#define HOME_H LCTL_T(KC_H)
#define HOME_T LSFT_T(KC_T)
#define HOME_N LALT_T(KC_N)
#define HOME_S LGUI_T(KC_S)

#define HOME_SS LGUI_T(KC_S)
#define HOME_ST LALT_T(KC_T)
#define HOME_SR LSFT_T(KC_R)
#define HOME_SD LCTL_T(KC_D)
#define HOME_SY LCTL_T(KC_Y)
#define HOME_SN LALT_T(KC_N)
#define HOME_SA LSFT_T(KC_A)
#define HOME_SE LSFT_T(KC_E)
#define HOME_SI LGUI_T(KC_I)

#define LT_1 LT(ONE, KC_COMM)
#define LT_2 LT(TWO, KC_R)
#define LT_3 LT(THREE, KC_QUOT)
#define LT_4 LT(FOUR, KC_L)

#define LT_S1 LT(ONE, KC_M)
#define LT_S2 LT(TWO, KC_U)
#define LT_S3 LT(THREE, KC_V)
#define LT_S4 LT(FOUR, KC_Q)
#define LT_S5 LT(FIVE, KC_L)
#define LT_S6 LT(SIX, KC_O)

#define DF_D DF(DVORAK)
#define DF_B DF(BASE)

#define STAR QK_AREP

#define UNDO LCTL(KC_Z)
#define REDO RCS(KC_Z)


enum layers {
    BASE,
    DVORAK,
    ONE,
    TWO,
    THREE,
    FOUR,
    FIVE,
    SIX
};

enum custom_keycodes {
    // QUOT = SAFE_RANGE,
    LLOCK = SAFE_RANGE,
    DCOL,
    ARRW,
    DARW,
    LAYER,
    MGONE,
    MGTWO,
    MGTHE
    // DQUO,
    // GRV,
    // TILD,
    // CIRC,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [BASE] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        KC_TAB ,  LT_S3  ,  LT_S1  ,  LT_S5  ,  KC_C   ,  KC_P   ,  KC_X   ,  STAR   ,  LT_S6  ,  LT_S2  ,  LT_S4  ,  MGONE  ,  MGTWO  ,            DF_D   ,  _______,
        KC_ESC ,  HOME_SS,  HOME_ST,  HOME_SR,  HOME_SD,  KC_Y   ,  KC_F   ,  HOME_SN,  HOME_SA,  HOME_SE,  HOME_SI,  KC_BSPC,                      KC_ENT ,  _______,
        _______,  KC_K   ,  KC_J   ,  KC_G   ,  KC_W   ,  KC_Z   ,  KC_B   ,  KC_H   ,  KC_DOT ,  KC_COMM,  KC_QUOT,                      KC_SCLN,  _______,
        _______,  _______,  _______,                                KC_SPC ,                      _______,  _______,  _______,            _______,  _______,  _______
        ),

    [DVORAK] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        KC_TAB ,  LT_3   ,  LT_1   ,  KC_DOT ,  KC_P   ,  KC_Y   ,  KC_F   ,  KC_G   ,  KC_C   ,  LT_2   ,  LT_4   ,  MGONE  ,  MGTWO  ,            DF_B   ,  _______,
        KC_ESC ,  HOME_A ,  HOME_O ,  HOME_E ,  HOME_U ,  KC_I   ,  KC_D   ,  HOME_H ,  HOME_T ,  HOME_N ,  HOME_S ,  KC_BSPC,                      KC_ENT ,  _______,
        _______,  KC_SCLN,  KC_Q   ,  KC_J   ,  KC_K   ,  KC_X   ,  KC_B   ,  KC_M   ,  KC_W   ,  KC_V   ,  KC_Z   ,                      _______,  _______,
        _______,  _______,  _______,                                KC_SPC ,                      _______,  _______,  _______,            _______,  _______,  _______
        ),

    [ONE] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        _______,  _______,  _______,  _______,  _______,  _______,  KC_LBRC,  KC_7   ,  KC_8   ,  KC_9   ,  KC_RBRC,  _______,  _______,  _______,            _______,
        _______,  _______,  _______,  _______,  _______,  _______,  KC_EQL ,  KC_4   ,  KC_5   ,  KC_6   ,  KC_0   ,  _______,                      _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  KC_MINS,  KC_1   ,  KC_2   ,  KC_3   ,  KC_SLSH,                      _______,  _______,
        _______,  _______,  _______,                                _______,                      _______,  _______,  _______,            _______,  _______,  _______
        ),

    [TWO] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        _______,  KC_PGUP,  KC_HOME,  KC_UP  ,  KC_END ,  KC_GRV ,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  KC_CAPS,  KC_LEFT,  KC_DOWN,  KC_RGHT,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  KC_PGDN,  UNDO   ,  REDO   ,  KC_DEL ,  KC_BSLS,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  _______,  _______,                                _______,                      _______,  _______,  _______,            _______,  _______,  _______
        ),

    [THREE] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  KC_F9  ,  KC_F10 ,  KC_F11 ,  KC_F12 ,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  KC_F5  ,  KC_F6  ,  KC_F7  ,  KC_F8  ,  _______,                      _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  KC_F1  ,  KC_F2  ,  KC_F3  ,  KC_F4  ,                      _______,  _______,
        _______,  _______,  _______,                                _______,                      _______,  _______,  _______,            _______,  _______,  _______
        ),

    [FOUR] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        _______,  _______,  KC_BRIU,  KC_VOLU,  KC_BRID,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  KC_PSCR,  KC_MPRV,  KC_MPLY,  KC_MNXT,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  _______,  KC_MUTE,  KC_VOLD,  KC_MSTP,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  _______,  _______,                                _______,                      _______,  _______,  _______,            _______,  _______,  _______
        ),

    [FIVE] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  KC_DEL ,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  _______,  _______,                                _______,                      _______,  _______,  _______,            _______,  _______,  _______
        ),

    [SIX] = LAYOUT_ansi_82(
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
        _______,  _______,  _______,                                _______,                      _______,  _______,  _______,            _______,  _______,  _______
        )

    // [EMPTY] = LAYOUT_ansi_82(
    //     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
    //     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
    //     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
    //     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
    //     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
    //     _______,  _______,  _______,                                _______,                      _______,  _______,  _______,            _______,  _______,  _______
    //     ),
};

#if defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][2] = {
    [BASE] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [DVORAK] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [ONE] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [TWO] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [THREE] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [FOUR] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [FIVE] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [SIX] = {ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
};
#endif


bool get_repeat_key_eligible_user(uint16_t keycode, keyrecord_t* record, uint8_t* remembered_mods) {
    switch (keycode) {
        // Ignore Custom Magic Keys
        case MGONE:
        case MGTWO:
            return false;
        case KC_A ... KC_Z:
            if ((*remembered_mods & ~(MOD_MASK_SHIFT)) == 0) {
                *remembered_mods &= ~MOD_MASK_SHIFT;
            }
            break;
    }

    return true;
}

uint16_t get_alt_repeat_key_keycode_user(uint16_t keycode, uint8_t mods) {
    switch (keycode) {
        case KC_C:
        case KC_P:
        case KC_D:
        case KC_G:
        case KC_Z: return KC_Y;
        case KC_Y: return KC_P;
        case KC_R: return KC_L;
        case KC_K: return KC_S;
        case KC_L:
        case KC_S: return KC_K;
        case KC_U: return KC_E;
        case KC_E: return KC_U;
        case KC_O: return KC_A;
        case KC_A: return KC_O;
        case KC_1 ... KC_0: return KC_DOT;
    }

    return MGTHE;
}

// void matrix_scan_user(void) {
//   achordion_task();
// }
//
// bool achordion_chord(uint16_t tap_hold_keycode, keyrecord_t* tap_hold_record, uint16_t other_keycode, keyrecord_t* other_record) {
//   return achordion_opposite_hands(tap_hold_record, other_record);
// }
//
// uint16_t achordion_timeout(uint16_t tap_hold_keycode) {
//   return 800;
// }
//
// bool achordion_eager_mod(uint8_t mod) {
//   switch (mod) {
//     case MOD_LSFT:
//     case MOD_RSFT:
//     case MOD_LCTL:
//     case MOD_RCTL:
//     case MOD_LALT:
//     case MOD_RALT:
//       return true;  // Eagerly apply Shift and Ctrl mods.
//
//     default:
//       return false;
//   }
// }

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    // if (!process_achordion(keycode, record)) { return false; }

    if (record->event.pressed) {
        switch (keycode) {
            case MGTHE:
                SEND_STRING("the");
                return false;
            case ARRW:
                SEND_STRING("->");
                return false;
            case DARW:
                SEND_STRING("=>");
                return false;
        }
    }
    return true;
}
