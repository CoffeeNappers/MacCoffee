.class final Lru/mail/libverify/sms/h$a$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/sms/h$a;->onCallStateChanged(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lru/mail/libverify/sms/h$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/sms/h$a;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/sms/h$a$1;->c:Lru/mail/libverify/sms/h$a;

    iput p2, p0, Lru/mail/libverify/sms/h$a$1;->a:I

    iput-object p3, p0, Lru/mail/libverify/sms/h$a$1;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "onCallStateChanged state %d number %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lru/mail/libverify/sms/h$a$1;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget-object v3, p0, Lru/mail/libverify/sms/h$a$1;->b:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/h$a$1;->c:Lru/mail/libverify/sms/h$a;

    invoke-static {v0}, Lru/mail/libverify/sms/h$a;->a(Lru/mail/libverify/sms/h$a;)Lru/mail/libverify/sms/g$b;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v0, p0, Lru/mail/libverify/sms/h$a$1;->a:I

    if-ne v0, v5, :cond_0

    iget-object v0, p0, Lru/mail/libverify/sms/h$a$1;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/sms/h$a$1;->c:Lru/mail/libverify/sms/h$a;

    invoke-static {v0}, Lru/mail/libverify/sms/h$a;->a(Lru/mail/libverify/sms/h$a;)Lru/mail/libverify/sms/g$b;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/sms/h$a$1;->b:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/sms/g$b;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/sms/h$a$1;->c:Lru/mail/libverify/sms/h$a;

    iget-object v0, v0, Lru/mail/libverify/sms/h$a;->a:Lru/mail/libverify/sms/h;

    invoke-virtual {v0}, Lru/mail/libverify/sms/h;->a()Landroid/telephony/TelephonyManager;

    move-result-object v1

    :try_start_0
    iget-object v0, v0, Lru/mail/libverify/sms/h;->a:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.CALL_PHONE"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "PhoneCallInterceptor"

    const-string/jumbo v1, "can\'t reject call without %s permission"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "android.permission.CALL_PHONE"

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-class v0, Landroid/telephony/TelephonyManager;

    const-string/jumbo v2, "getITelephony"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "com.android.internal.telephony.ITelephony"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "endCall"

    invoke-static {v1, v0, v2}, Lru/mail/libverify/sms/h;->a(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v2, "silenceRinger"

    invoke-static {v1, v0, v2}, Lru/mail/libverify/sms/h;->a(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v2, "cancelMissedCallsNotification"

    invoke-static {v1, v0, v2}, Lru/mail/libverify/sms/h;->a(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "PhoneCallInterceptor"

    const-string/jumbo v2, "can\'t reject call"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
