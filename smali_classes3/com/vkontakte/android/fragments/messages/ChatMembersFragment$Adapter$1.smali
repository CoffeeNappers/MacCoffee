.class Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$1;
.super Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;
.source "ChatMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;Landroid/view/ViewGroup;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 607
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$1;->this$1:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;-><init>(Landroid/view/ViewGroup;)V

    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 1

    .prologue
    .line 610
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$1;->this$1:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->leave()V

    .line 611
    return-void
.end method
