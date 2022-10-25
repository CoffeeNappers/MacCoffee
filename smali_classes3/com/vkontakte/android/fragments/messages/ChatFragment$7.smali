.class Lcom/vkontakte/android/fragments/messages/ChatFragment$7;
.super Lcom/vk/attachpicker/widget/VkBottomSheetBehavior$BottomSheetCallback;
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
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1168
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$7;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior$BottomSheetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlide(Landroid/view/View;F)V
    .locals 0
    .param p1, "bottomSheet"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "slideOffset"    # F

    .prologue
    .line 1179
    return-void
.end method

.method public onStateChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "bottomSheet"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "newState"    # I

    .prologue
    .line 1171
    const/4 v0, 0x5

    if-ne p2, v0, :cond_0

    .line 1172
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$7;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideMentionSuggestions()V

    .line 1174
    :cond_0
    return-void
.end method

.method public onTargetStateChanged(Landroid/view/View;I)V
    .locals 0
    .param p1, "bottomSheet"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "targetState"    # I

    .prologue
    .line 1184
    return-void
.end method
