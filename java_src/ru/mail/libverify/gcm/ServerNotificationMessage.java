package ru.mail.libverify.gcm;

import android.text.TextUtils;
import java.util.Set;
import ru.mail.libverify.requests.k;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class ServerNotificationMessage implements Gsonable {
    public Integer hold_timeout;
    public Message message;
    public String sender;
    public long server_timestamp = 0;
    public long timestamp = 0;
    public k.b deliveryMethod = k.b.UNKNOWN;

    /* loaded from: classes3.dex */
    public static class Message implements Gsonable {
        public String application_id;
        public Controls controls;
        public Set<a> delivery_flags;
        public String from;
        public String imei;
        public String imsi;
        public String phone;
        public String public_text;
        private long requester_id;
        public String requester_package_name;
        public String session_id;
        public String text;
        public b type;
        public String verification_url;
        public String verify_code;

        /* loaded from: classes3.dex */
        public static class Controls implements Gsonable {
            private Confirm confirm;
            private Description description;

            /* loaded from: classes3.dex */
            public static class Confirm implements Gsonable {
                private int enableTimeoutSec;
                String text;

                public boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (obj == null || getClass() != obj.getClass()) {
                        return false;
                    }
                    Confirm confirm = (Confirm) obj;
                    if (this.enableTimeoutSec != confirm.enableTimeoutSec) {
                        return false;
                    }
                    return this.text != null ? this.text.equals(confirm.text) : confirm.text == null;
                }

                public int hashCode() {
                    return ((this.text != null ? this.text.hashCode() : 0) * 31) + this.enableTimeoutSec;
                }
            }

            /* loaded from: classes3.dex */
            public static class Description implements Gsonable {
                private String text;

                public boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (obj == null || getClass() != obj.getClass()) {
                        return false;
                    }
                    Description description = (Description) obj;
                    return this.text != null ? this.text.equals(description.text) : description.text == null;
                }

                public int hashCode() {
                    if (this.text != null) {
                        return this.text.hashCode();
                    }
                    return 0;
                }
            }

            public boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (obj == null || getClass() != obj.getClass()) {
                    return false;
                }
                Controls controls = (Controls) obj;
                if (this.confirm == null ? controls.confirm != null : !this.confirm.equals(controls.confirm)) {
                    return false;
                }
                return this.description != null ? this.description.equals(controls.description) : controls.description == null;
            }

            public int hashCode() {
                int i = 0;
                int hashCode = (this.confirm != null ? this.confirm.hashCode() : 0) * 31;
                if (this.description != null) {
                    i = this.description.hashCode();
                }
                return hashCode + i;
            }
        }

        /* loaded from: classes.dex */
        public enum a {
            POPUP,
            IPC,
            SMS,
            UNKNOWN
        }

        /* loaded from: classes.dex */
        public enum b {
            MESSAGE,
            PING,
            VERIFIED,
            UNKNOWN
        }

        public final boolean a() {
            return (this.controls == null || this.controls.confirm == null || TextUtils.isEmpty(this.controls.confirm.text)) ? false : true;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            Message message = (Message) obj;
            if (this.requester_id != message.requester_id) {
                return false;
            }
            if (this.text == null ? message.text != null : !this.text.equals(message.text)) {
                return false;
            }
            if (this.verify_code == null ? message.verify_code != null : !this.verify_code.equals(message.verify_code)) {
                return false;
            }
            if (this.from == null ? message.from != null : !this.from.equals(message.from)) {
                return false;
            }
            if (this.delivery_flags == null ? message.delivery_flags != null : !this.delivery_flags.equals(message.delivery_flags)) {
                return false;
            }
            if (this.type != message.type) {
                return false;
            }
            if (this.imsi == null ? message.imsi != null : !this.imsi.equals(message.imsi)) {
                return false;
            }
            if (this.imei == null ? message.imei != null : !this.imei.equals(message.imei)) {
                return false;
            }
            if (this.session_id == null ? message.session_id != null : !this.session_id.equals(message.session_id)) {
                return false;
            }
            if (this.application_id == null ? message.application_id != null : !this.application_id.equals(message.application_id)) {
                return false;
            }
            if (this.phone == null ? message.phone != null : !this.phone.equals(message.phone)) {
                return false;
            }
            if (this.controls == null ? message.controls != null : !this.controls.equals(message.controls)) {
                return false;
            }
            if (this.verification_url == null ? message.verification_url != null : !this.verification_url.equals(message.verification_url)) {
                return false;
            }
            return this.requester_package_name != null ? this.requester_package_name.equals(message.requester_package_name) : message.requester_package_name == null;
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.verification_url != null ? this.verification_url.hashCode() : 0) + (((this.controls != null ? this.controls.hashCode() : 0) + (((this.phone != null ? this.phone.hashCode() : 0) + (((this.application_id != null ? this.application_id.hashCode() : 0) + (((this.session_id != null ? this.session_id.hashCode() : 0) + (((this.imei != null ? this.imei.hashCode() : 0) + (((this.imsi != null ? this.imsi.hashCode() : 0) + (((this.type != null ? this.type.hashCode() : 0) + (((this.delivery_flags != null ? this.delivery_flags.hashCode() : 0) + (((this.from != null ? this.from.hashCode() : 0) + (((this.verify_code != null ? this.verify_code.hashCode() : 0) + ((this.text != null ? this.text.hashCode() : 0) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
            if (this.requester_package_name != null) {
                i = this.requester_package_name.hashCode();
            }
            return ((hashCode + i) * 31) + ((int) (this.requester_id ^ (this.requester_id >>> 32)));
        }

        public String toString() {
            return "Message{text='" + this.text + "', from='" + this.from + "', session_id='" + this.session_id + "', requester_package_name=" + this.requester_package_name + ", requester_id='" + this.requester_id + "'}";
        }
    }

    public final String a() {
        return this.message.from + Long.toString(this.message.requester_id);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ServerNotificationMessage serverNotificationMessage = (ServerNotificationMessage) obj;
        return this.message != null ? this.message.equals(serverNotificationMessage.message) : serverNotificationMessage.message == null;
    }

    public int hashCode() {
        if (this.message != null) {
            return this.message.hashCode();
        }
        return 0;
    }

    public String toString() {
        return "ServerNotificationMessage{message=" + this.message + ", sender='" + this.sender + "', timestamp=" + this.timestamp + ", hold_timeout=" + this.hold_timeout + ", deliveryMethod=" + this.deliveryMethod + '}';
    }
}
