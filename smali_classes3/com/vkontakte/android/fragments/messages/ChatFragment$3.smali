.class Lcom/vkontakte/android/fragments/messages/ChatFragment$3;
.super Landroid/widget/LinearLayout;
.source "ChatFragment.java"


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
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 965
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 967
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;->onSizeChanged(IIII)V

    .line 968
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 969
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->notifyLayoutHasChanged()V

    .line 971
    :cond_0
    return-void
.end method
