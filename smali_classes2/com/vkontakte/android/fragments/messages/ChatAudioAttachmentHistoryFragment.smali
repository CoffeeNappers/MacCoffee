.class public Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "ChatAudioAttachmentHistoryFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$AudioViewHolder;,
        Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;"
    }
.end annotation


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;

.field private nextFrom:Ljava/lang/String;

.field private final playerListener:Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 62
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 46
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;-><init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;

    .line 58
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->adapter:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;

    .line 59
    iput-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->nextFrom:Ljava/lang/String;

    .line 63
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->nextFrom:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->nextFrom:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->showContextMenuFor(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->enqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v0

    return v0
.end method

.method public static create(I)Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    .locals 3
    .param p0, "peer"    # I

    .prologue
    .line 39
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 40
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "peer_id"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 41
    new-instance v1, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;-><init>()V

    .line 42
    .local v1, "fr":Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->setArguments(Landroid/os/Bundle;)V

    .line 43
    return-object v1
.end method

.method private enqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 3
    .param p1, "file"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    const/4 v0, 0x0

    .line 202
    invoke-static {p1}, Lcom/vkontakte/android/audio/AudioFacade;->enqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 206
    :goto_0
    return v0

    .line 205
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0800e6

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 206
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private showContextMenuFor(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 5
    .param p1, "file"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 178
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 179
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Ljava/lang/CharSequence;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 180
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/vkontakte/android/audio/AudioFacade;->canEnqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 181
    const v2, 0x7f0800e4

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    const-string/jumbo v2, "enqueue"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 186
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0800e1

    .line 187
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/CharSequence;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/CharSequence;

    new-instance v4, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$3;

    invoke-direct {v4, p0, v1, p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$3;-><init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Ljava/util/List;Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 195
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 196
    const/4 v2, 0x1

    .line 198
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 78
    if-nez p1, :cond_0

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->nextFrom:Ljava/lang/String;

    .line 81
    :cond_0
    const-class v0, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "peer_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->nextFrom:Ljava/lang/String;

    invoke-static {v0, v1, v2, p2}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments;->create(Ljava/lang/Class;ILjava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;-><init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Landroid/app/Fragment;)V

    .line 82
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 94
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 96
    :cond_1
    return-void
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->adapter:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$Adapter;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 68
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 71
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 73
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 100
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 101
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->loadData()V

    .line 106
    :goto_0
    return-void

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->dataLoaded()V

    goto :goto_0
.end method
