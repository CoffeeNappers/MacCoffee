.class Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "ChatAudioAttachmentHistoryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)V
    .locals 0

    .prologue
    .line 113
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 113
    check-cast p1, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;->bind(Ljava/lang/Object;)V

    .line 122
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 113
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 116
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;-><init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)V

    return-object v0
.end method
