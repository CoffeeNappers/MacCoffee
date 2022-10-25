package com.my.tracker;
/* loaded from: classes.dex */
public final class MyTrackerParams {
    private final b internalParams;

    /* loaded from: classes2.dex */
    public interface Gender {
        public static final int FEMALE = 2;
        public static final int MALE = 1;
        public static final int UNKNOWN = 0;
        public static final int UNSPECIFIED = -1;
    }

    public final int getAge() {
        return this.internalParams.a();
    }

    public final String getCustomUserId() {
        return this.internalParams.b();
    }

    public final String[] getCustomUserIds() {
        return this.internalParams.c();
    }

    public final String getEmail() {
        return this.internalParams.d();
    }

    public final String[] getEmails() {
        return this.internalParams.e();
    }

    public final int getGender() {
        return this.internalParams.f();
    }

    public final String getIcqId() {
        return this.internalParams.g();
    }

    public final String[] getIcqIds() {
        return this.internalParams.h();
    }

    public final String getId() {
        return this.internalParams.i();
    }

    public final String getLang() {
        return this.internalParams.j();
    }

    public final int getLaunchTimeout() {
        return this.internalParams.k();
    }

    public final String getMrgsAppId() {
        return this.internalParams.l();
    }

    public final String getMrgsId() {
        return this.internalParams.m();
    }

    public final String getMrgsUserId() {
        return this.internalParams.n();
    }

    public final String getOkId() {
        return this.internalParams.o();
    }

    public final String[] getOkIds() {
        return this.internalParams.p();
    }

    public final String getVKId() {
        return this.internalParams.q();
    }

    public final String[] getVKIds() {
        return this.internalParams.r();
    }

    public final String getVendorAppPackage() {
        return this.internalParams.s();
    }

    public final boolean isTrackingAppsEnabled() {
        return this.internalParams.t();
    }

    public final boolean isTrackingEnvironmentEnabled() {
        return this.internalParams.u();
    }

    public final boolean isTrackingLaunchEnabled() {
        return this.internalParams.v();
    }

    public final boolean isTrackingLocationEnabled() {
        return this.internalParams.w();
    }

    public final void setAge(int i) {
        this.internalParams.a(i);
    }

    public final void setCustomUserId(String str) {
        this.internalParams.a(str);
    }

    public final void setCustomUserIds(String[] strArr) {
        this.internalParams.a(strArr);
    }

    public final void setDefaultVendorAppPackage() {
        this.internalParams.x();
    }

    public final void setEmail(String str) {
        this.internalParams.b(str);
    }

    public final void setEmails(String[] strArr) {
        this.internalParams.b(strArr);
    }

    public final void setGender(int i) {
        this.internalParams.b(i);
    }

    public final void setIcqId(String str) {
        this.internalParams.c(str);
    }

    public final void setIcqIds(String[] strArr) {
        this.internalParams.c(strArr);
    }

    public final void setLang(String str) {
        this.internalParams.d(str);
    }

    public final void setLaunchTimeout(int i) {
        this.internalParams.c(i);
    }

    public final void setMrgsAppId(String str) {
        this.internalParams.e(str);
    }

    public final void setMrgsId(String str) {
        this.internalParams.f(str);
    }

    public final void setMrgsUserId(String str) {
        this.internalParams.g(str);
    }

    public final void setOkId(String str) {
        this.internalParams.h(str);
    }

    public final void setOkIds(String[] strArr) {
        this.internalParams.d(strArr);
    }

    public final void setTrackingAppsEnabled(boolean z) {
        this.internalParams.a(z);
    }

    public final void setTrackingEnvironmentEnabled(boolean z) {
        this.internalParams.b(z);
    }

    public final void setTrackingLaunchEnabled(boolean z) {
        this.internalParams.c(z);
    }

    public final void setTrackingLocationEnabled(boolean z) {
        this.internalParams.d(z);
    }

    public final void setVKId(String str) {
        this.internalParams.i(str);
    }

    public final void setVKIds(String[] strArr) {
        this.internalParams.e(strArr);
    }

    public final void setVendorAppPackage(String str) {
        this.internalParams.j(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MyTrackerParams(b bVar) {
        this.internalParams = bVar;
    }
}
