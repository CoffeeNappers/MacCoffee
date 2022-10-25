.class Lcom/vkontakte/android/sdk/SDKInviteActivity$1;
.super Ljava/lang/Object;
.source "SDKInviteActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/sdk/SDKInviteActivity;->showResendDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/sdk/SDKInviteActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/sdk/SDKInviteActivity;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$1;->this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 199
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$1;->this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;

    invoke-static {v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->access$000(Lcom/vkontakte/android/sdk/SDKInviteActivity;)V

    .line 202
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 203
    return-void
.end method
