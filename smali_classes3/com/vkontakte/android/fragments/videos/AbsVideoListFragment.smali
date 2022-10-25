.class public abstract Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "AbsVideoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoHolder;,
        Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;"
    }
.end annotation


# static fields
.field static final VIDEO_EDIT:I = 0x2068


# instance fields
.field private mOffset:I

.field private mOwnerId:I

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field protected mSelectMode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 51
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOwnerId:I

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOffset:I

    .line 53
    new-instance v0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$1;-><init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 66
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOffset:I

    return v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
    .param p1, "x1"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOffset:I

    return p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method addVideo(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 3
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 297
    new-instance v0, Lcom/vkontakte/android/api/video/VideoAdd;

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/video/VideoAdd;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$4;

    .line 298
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$4;-><init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoAdd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 305
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 306
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 307
    return-void
.end method

.method copyLink(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 4
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 274
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 275
    .local v0, "cm":Landroid/text/ClipboardManager;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "https://vk.com/video"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 276
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f080339

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 277
    return-void
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">.GridAdapter<*>;"
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$VideoAdapter;-><init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$1;)V

    return-object v0
.end method

.method deleteVideo(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 257
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->deleteVideoFile(Lcom/vkontakte/android/api/VideoFile;)V

    .line 258
    return-void
.end method

.method final deleteVideoFile(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 4
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 261
    new-instance v0, Lcom/vkontakte/android/api/video/VideoDelete;

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget v3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOwnerId:I

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/video/VideoDelete;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;

    .line 262
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;-><init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 268
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 269
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 270
    return-void
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 133
    if-nez p1, :cond_0

    .line 134
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOffset:I

    .line 136
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOffset:I

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getRequest(II)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;

    invoke-direct {v1, p0, p0, p2}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;-><init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Landroid/app/Fragment;I)V

    .line 137
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 152
    return-void
.end method

.method protected getColumnsCount()I
    .locals 4

    .prologue
    .line 99
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 100
    .local v1, "listWidth":I
    iget v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->scrW:I

    const/16 v3, 0x258

    if-lt v2, v3, :cond_0

    const/high16 v2, 0x43800000    # 256.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 101
    .local v0, "columnWidth":I
    :goto_0
    div-int v2, v1, v0

    return v2

    .end local v0    # "columnWidth":I
    :cond_0
    move v0, v1

    .line 100
    goto :goto_0
.end method

.method protected getOwnerID()I
    .locals 1

    .prologue
    .line 162
    iget v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOwnerId:I

    return v0
.end method

.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOwnerId:I

    if-ltz v0, :cond_0

    const-string/jumbo v0, "videos_user"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "videos_group"

    goto :goto_0
.end method

.method protected abstract getRequest(II)Lcom/vkontakte/android/api/VKAPIRequest;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;>;"
        }
    .end annotation
.end method

.method synthetic lambda$showVideoFileDeleteDialog$0(Lcom/vkontakte/android/api/VideoFile;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 250
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->deleteVideo(Lcom/vkontakte/android/api/VideoFile;)V

    .line 251
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 89
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 90
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 91
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->loadData()V

    .line 95
    :goto_0
    return-void

    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->dataLoaded()V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 112
    const/4 v2, -0x1

    if-ne p2, v2, :cond_0

    .line 113
    packed-switch p1, :pswitch_data_0

    .line 129
    :cond_0
    :goto_0
    return-void

    .line 115
    :pswitch_0
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->loaded:Z

    if-eqz v2, :cond_0

    .line 116
    const-string/jumbo v2, "video"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoFile;

    .line 117
    .local v1, "video":Lcom/vkontakte/android/api/VideoFile;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 118
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/VideoFile;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 119
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyItemChanged(I)V

    goto :goto_0

    .line 117
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 113
    nop

    :pswitch_data_0
    .packed-switch 0x2068
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 70
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 71
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "select"

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mSelectMode:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mSelectMode:Z

    .line 72
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "uid"

    iget v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOwnerId:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOwnerId:I

    .line 73
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.POST_DELETED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 74
    return-void
.end method

.method protected onCreatePopupMenu(Lcom/vkontakte/android/api/VideoFile;Landroid/view/Menu;)V
    .locals 3
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v2, 0x0

    .line 207
    iget-boolean v0, p1, Lcom/vkontakte/android/api/VideoFile;->canEdit:Z

    if-eqz v0, :cond_0

    .line 208
    const v0, 0x7f1005f0

    const v1, 0x7f0801c7

    invoke-interface {p2, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 210
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getOwnerID()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    if-gez v0, :cond_2

    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    neg-int v0, v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_2

    .line 211
    :cond_1
    const v0, 0x7f1005e8

    const v1, 0x7f08019c

    invoke-interface {p2, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 213
    :cond_2
    iget v0, p1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 214
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getOwnerID()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 215
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p1, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    if-eqz v0, :cond_3

    .line 217
    const v0, 0x7f1000b0

    const v1, 0x7f0800a3

    invoke-interface {p2, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 219
    :cond_3
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p1, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    if-eqz v0, :cond_4

    .line 220
    const v0, 0x7f100004

    const v1, 0x7f08074e

    invoke-interface {p2, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 222
    :cond_4
    const v0, 0x7f10000f

    const v1, 0x7f080184

    invoke-interface {p2, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 223
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 224
    const v0, 0x7f1002c9

    const v1, 0x7f0805bf

    invoke-interface {p2, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 226
    :cond_5
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 106
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 107
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDestroy()V

    .line 108
    return-void
.end method

.method protected onItemClick(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 3
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 166
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mSelectMode:Z

    if-eqz v1, :cond_0

    .line 167
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 168
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "video"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 169
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 170
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 174
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 172
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->openVideo(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0
.end method

.method protected onPopupItemSelected(Lcom/vkontakte/android/api/VideoFile;Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 177
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 203
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 179
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->showEditDialog(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0

    .line 183
    :sswitch_1
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->showDeleteDialog(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0

    .line 187
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->addVideo(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0

    .line 191
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->showAddToAlbumDialog(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0

    .line 195
    :sswitch_4
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->copyLink(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0

    .line 199
    :sswitch_5
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->share(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_0

    .line 177
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f100004 -> :sswitch_3
        0x7f10000f -> :sswitch_4
        0x7f1000b0 -> :sswitch_2
        0x7f1002c9 -> :sswitch_5
        0x7f1005e8 -> :sswitch_1
        0x7f1005f0 -> :sswitch_0
    .end sparse-switch
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 78
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment;->onResume()V

    .line 79
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->updateLayoutManager(Z)V

    .line 80
    return-void
.end method

.method openVideo(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 229
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->convertToPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getReferer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->resetScroll(Z)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 230
    return-void
.end method

.method prepend(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    const/4 v1, 0x0

    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 293
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyItemInserted(I)V

    .line 294
    return-void
.end method

.method removeItem(II)V
    .locals 3
    .param p1, "oid"    # I
    .param p2, "vid"    # I

    .prologue
    .line 280
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 281
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoFile;

    .line 282
    .local v1, "item":Lcom/vkontakte/android/api/VideoFile;
    iget v2, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    if-ne v2, p1, :cond_1

    iget v2, v1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    if-ne v2, p2, :cond_1

    .line 283
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 284
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyItemRemoved(I)V

    .line 285
    iget v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOffset:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->mOffset:I

    .line 289
    .end local v1    # "item":Lcom/vkontakte/android/api/VideoFile;
    :cond_0
    return-void

    .line 280
    .restart local v1    # "item":Lcom/vkontakte/android/api/VideoFile;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method share(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 233
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 234
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    const-string/jumbo v1, "videos"

    .line 235
    invoke-static {p1, v1}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 236
    invoke-static {p1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/api/VideoFile;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 237
    invoke-virtual {v0}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 239
    :cond_0
    return-void
.end method

.method showAddToAlbumDialog(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 310
    new-instance v0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;-><init>(Landroid/content/Context;)V

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->showAlbumsDialog(ILcom/vkontakte/android/api/VideoFile;)V

    .line 311
    return-void
.end method

.method showDeleteDialog(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 242
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->showVideoFileDeleteDialog(Lcom/vkontakte/android/api/VideoFile;)V

    .line 243
    return-void
.end method

.method showEditDialog(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 314
    invoke-static {p1}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->edit(Lcom/vkontakte/android/api/VideoFile;)Lcom/vkontakte/android/navigation/Navigator;

    move-result-object v0

    const/16 v1, 0x2068

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 315
    return-void
.end method

.method final showVideoFileDeleteDialog(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 3
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 246
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801b1

    .line 247
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801af

    .line 248
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Lcom/vkontakte/android/api/VideoFile;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 249
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 252
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 253
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 254
    return-void
.end method
