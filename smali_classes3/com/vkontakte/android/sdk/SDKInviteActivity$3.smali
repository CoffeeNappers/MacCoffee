.class Lcom/vkontakte/android/sdk/SDKInviteActivity$3;
.super Ljava/lang/Object;
.source "SDKInviteActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/sdk/SDKInviteActivity;->sendInvite(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;

.field final synthetic val$uid:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/sdk/SDKInviteActivity;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/sdk/SDKInviteActivity;

    .prologue
    .line 240
    iput-object p1, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;->this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;

    iput p2, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;->val$uid:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;->this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;

    invoke-static {v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->access$300(Lcom/vkontakte/android/sdk/SDKInviteActivity;)V

    .line 251
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "mid"    # Ljava/lang/Integer;

    .prologue
    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;->this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->access$102(Lcom/vkontakte/android/sdk/SDKInviteActivity;Z)Z

    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;->this$0:Lcom/vkontakte/android/sdk/SDKInviteActivity;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget v2, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;->val$uid:I

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->access$200(Lcom/vkontakte/android/sdk/SDKInviteActivity;II)V

    .line 246
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 240
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;->success(Ljava/lang/Integer;)V

    return-void
.end method
