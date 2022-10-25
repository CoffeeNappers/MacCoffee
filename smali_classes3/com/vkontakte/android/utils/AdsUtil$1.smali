.class final Lcom/vkontakte/android/utils/AdsUtil$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "AdsUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/utils/AdsUtil;->joinGroup(Landroid/content/Context;ILcom/vkontakte/android/api/ButtonAction;Lcom/vkontakte/android/data/PostInteract;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$buttonAction:Lcom/vkontakte/android/api/ButtonAction;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 145
    iput-object p2, p0, Lcom/vkontakte/android/utils/AdsUtil$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/vkontakte/android/utils/AdsUtil$1;->val$buttonAction:Lcom/vkontakte/android/api/ButtonAction;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/utils/AdsUtil$1;->val$context:Landroid/content/Context;

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 154
    return-void
.end method

.method public success()V
    .locals 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/utils/AdsUtil$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/utils/AdsUtil$1;->val$buttonAction:Lcom/vkontakte/android/api/ButtonAction;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/AdsUtil;->access$000(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;)V

    .line 149
    return-void
.end method
