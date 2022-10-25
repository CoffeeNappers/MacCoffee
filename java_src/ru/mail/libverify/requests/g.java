package ru.mail.libverify.requests;

import com.vkontakte.android.fragments.SignupPhoneFragment;
/* loaded from: classes3.dex */
enum g {
    DEVICE { // from class: ru.mail.libverify.requests.g.1
        @Override // ru.mail.libverify.requests.g
        public final String a() {
            return "device";
        }
    },
    PHONE { // from class: ru.mail.libverify.requests.g.2
        @Override // ru.mail.libverify.requests.g
        public final String a() {
            return SignupPhoneFragment.KEY_PHONE;
        }
    },
    NOTHING { // from class: ru.mail.libverify.requests.g.3
        @Override // ru.mail.libverify.requests.g
        public final String a() {
            return null;
        }
    };

    /* synthetic */ g(byte b) {
        this();
    }

    public abstract String a();
}
