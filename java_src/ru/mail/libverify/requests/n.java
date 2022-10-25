package ru.mail.libverify.requests;
/* loaded from: classes3.dex */
enum n {
    REPORT_PHONE_NUMBER_REUSE { // from class: ru.mail.libverify.requests.n.1
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "report_reuse";
        }
    },
    REPORT_SPAM { // from class: ru.mail.libverify.requests.n.10
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "report_spam";
        }
    },
    BLOCK { // from class: ru.mail.libverify.requests.n.11
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "block";
        }
    },
    CHECK { // from class: ru.mail.libverify.requests.n.12
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "check";
        }
    },
    REPORT_SIGNOUT { // from class: ru.mail.libverify.requests.n.13
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "report_signout";
        }
    },
    REPORT_SOFT_SIGNOUT { // from class: ru.mail.libverify.requests.n.14
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "report_soft_signout";
        }
    },
    REPORT_NO_GCM_SERVICE { // from class: ru.mail.libverify.requests.n.15
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "report_no_gcm_service";
        }
    },
    REQUEST_SMS_INFO { // from class: ru.mail.libverify.requests.n.16
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "request_sms_info";
        }
    },
    PING_RESPONSE_GCM { // from class: ru.mail.libverify.requests.n.17
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "ping_response_gcm";
        }
    },
    PING_RESPONSE_FETCHER { // from class: ru.mail.libverify.requests.n.2
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "ping_response_fetcher";
        }
    },
    CHECK_SETTINGS_PACKAGES_CHANGED { // from class: ru.mail.libverify.requests.n.3
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "check_settings_packages_changed";
        }
    },
    CHECK_SETTINGS_TIMER { // from class: ru.mail.libverify.requests.n.4
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "check_settings_timer";
        }
    },
    CHECK_SETTINGS_RESTART { // from class: ru.mail.libverify.requests.n.5
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "check_settings_restart";
        }
    },
    REQUEST_APP_CHECK_ID { // from class: ru.mail.libverify.requests.n.6
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "request_app_check_id";
        }
    },
    CONFIRM_APP_CHECK { // from class: ru.mail.libverify.requests.n.7
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "confirm_app_check";
        }
    },
    CHECK_INTERCEPTED { // from class: ru.mail.libverify.requests.n.8
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return "check_intercepted";
        }
    },
    NO_ACTION { // from class: ru.mail.libverify.requests.n.9
        @Override // ru.mail.libverify.requests.n
        public final String a() {
            return null;
        }
    };

    /* synthetic */ n(byte b) {
        this();
    }

    public abstract String a();
}
