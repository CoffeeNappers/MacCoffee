.class Lcom/vkontakte/android/fragments/messages/ChatFragment$9;
.super Ljava/lang/Object;
.source "ChatFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1295
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$9;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 1298
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 1302
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 1306
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$9;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1307
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$9;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 1309
    :cond_0
    return-void
.end method
