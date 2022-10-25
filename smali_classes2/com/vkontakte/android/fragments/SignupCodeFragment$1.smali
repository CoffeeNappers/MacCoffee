.class Lcom/vkontakte/android/fragments/SignupCodeFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "SignupCodeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SignupCodeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 59
    const-string/jumbo v2, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 60
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "pdus"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, [Ljava/lang/Object;

    .line 61
    .local v0, "pdus":[Ljava/lang/Object;
    const/4 v2, 0x0

    aget-object v2, v0, v2

    check-cast v2, [B

    check-cast v2, [B

    invoke-static {v2}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v1

    .line 62
    .local v1, "sms":Landroid/telephony/SmsMessage;
    invoke-virtual {v1}, Landroid/telephony/SmsMessage;->getTimestampMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$000(Lcom/vkontakte/android/fragments/SignupCodeFragment;)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 63
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-virtual {v1}, Landroid/telephony/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$100(Lcom/vkontakte/android/fragments/SignupCodeFragment;Ljava/lang/String;)V

    .line 66
    .end local v0    # "pdus":[Ljava/lang/Object;
    .end local v1    # "sms":Landroid/telephony/SmsMessage;
    :cond_0
    return-void
.end method
