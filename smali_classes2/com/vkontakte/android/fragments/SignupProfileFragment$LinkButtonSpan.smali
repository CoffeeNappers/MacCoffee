.class Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;
.super Lcom/vkontakte/android/LinkSpan;
.source "SignupProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SignupProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LinkButtonSpan"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/String;)V
    .locals 1
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 438
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .line 439
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 440
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 450
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;->getLink()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 451
    .local v0, "link":I
    packed-switch v0, :pswitch_data_0

    .line 459
    :goto_0
    return-void

    .line 453
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    const-string/jumbo v2, "https://m.vk.com/terms?api_view=1&lang=%s"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1500(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/String;)V

    goto :goto_0

    .line 456
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    const-string/jumbo v2, "https://m.vk.com/privacy?api_view=1&lang=%s"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1500(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/String;)V

    goto :goto_0

    .line 451
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1, "ds"    # Landroid/text/TextPaint;

    .prologue
    .line 444
    invoke-super {p0, p1}, Lcom/vkontakte/android/LinkSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 445
    const v0, -0xbf8548

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 446
    return-void
.end method
