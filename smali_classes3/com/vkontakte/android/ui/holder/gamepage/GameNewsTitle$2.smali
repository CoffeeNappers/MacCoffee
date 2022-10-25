.class Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "GameNewsTitle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->leaveGroup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$2;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 89
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$2;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 90
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 91
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/16 v2, 0xf

    if-ne v0, v2, :cond_0

    const v0, 0x7f08048c

    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 92
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 93
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 94
    return-void

    .line 91
    :cond_0
    const v0, 0x7f0801f6

    goto :goto_0
.end method

.method public success()V
    .locals 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$2;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;->isMember:Z

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$2;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->subscribeButton:Landroid/widget/TextView;

    const v1, 0x7f08025b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 85
    return-void
.end method
