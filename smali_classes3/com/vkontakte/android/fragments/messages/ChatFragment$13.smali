.class Lcom/vkontakte/android/fragments/messages/ChatFragment$13;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1898
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$13;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 1901
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$13;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$800(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 1902
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1898
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$13;->success(Ljava/lang/Boolean;)V

    return-void
.end method
