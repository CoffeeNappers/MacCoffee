.class public Lcom/vkontakte/android/fragments/GameCardFragment;
.super Lcom/vkontakte/android/fragments/PostListFragment;
.source "GameCardFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/GameCardFragment$MergeRecyclerAdapterProvider;,
        Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;,
        Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;
    }
.end annotation


# static fields
.field public static final INVITE_RESULT:I = 0xf3f

.field private static final KEY_APP:Ljava/lang/String; = "app"

.field private static final KEY_APP_INDEX:Ljava/lang/String; = "app_index_in_list"


# instance fields
.field private apiApplication:Lcom/vkontakte/android/data/ApiApplication;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private buttonPlay:Landroid/widget/TextView;

.field private drawablesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;",
            ">;>;"
        }
    .end annotation
.end field

.field private fixedPostId:I

.field private gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

.field private groupId:I

.field private iOnListViewCreated:Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;

.field private imageViewIcon:Lcom/vk/imageloader/view/VKImageView;

.field private nextFrom:Ljava/lang/String;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private receiverDeleteRequest:Landroid/content/BroadcastReceiver;

.field private receiverReloadInstalled:Landroid/content/BroadcastReceiver;

.field private textViewGenre:Landroid/widget/TextView;

.field private textViewName:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 143
    const v0, 0x7f0300af

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/PostListFragment;-><init>(I)V

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->drawablesList:Ljava/util/ArrayList;

    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->groupId:I

    .line 90
    iput-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->nextFrom:Ljava/lang/String;

    .line 92
    new-instance v0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    new-instance v1, Lcom/vkontakte/android/fragments/GameCardFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/GameCardFragment$1;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    invoke-direct {v0, v1, p0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;-><init>(Landroid/view/View$OnClickListener;Lcom/vkontakte/android/fragments/GameCardFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    .line 104
    iput-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->iOnListViewCreated:Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;

    .line 106
    new-instance v0, Lcom/vkontakte/android/fragments/GameCardFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GameCardFragment$2;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 118
    new-instance v0, Lcom/vkontakte/android/fragments/GameCardFragment$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GameCardFragment$3;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    .line 131
    new-instance v0, Lcom/vkontakte/android/fragments/GameCardFragment$4;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GameCardFragment$4;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiverReloadInstalled:Landroid/content/BroadcastReceiver;

    .line 144
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/GameCardFragment;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/GameCardFragment;->loadWall(II)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->startHidingRequest()V

    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/GameCardFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->refreshing:Z

    return v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/GameCardFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->fixedPostId:I

    return v0
.end method

.method static synthetic access$1302(Lcom/vkontakte/android/fragments/GameCardFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p1, "x1"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->fixedPostId:I

    return p1
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/GameCardFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->refreshing:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1600(Ljava/util/Iterator;Lcom/vkontakte/android/NewsEntry;Ljava/util/Collection;)Z
    .locals 1
    .param p0, "x0"    # Ljava/util/Iterator;
    .param p1, "x1"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "x2"    # Ljava/util/Collection;

    .prologue
    .line 69
    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/GameCardFragment;->removeNewsFromIterator(Ljava/util/Iterator;Lcom/vkontakte/android/NewsEntry;Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/fragments/GameCardFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->nextFrom:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1902(Lcom/vkontakte/android/fragments/GameCardFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->doLoadData()V

    return-void
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->drawablesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/GameCardFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/GameCardFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/fragments/GameCardFragment;Lcom/vkontakte/android/data/ApiApplication;)Lcom/vkontakte/android/data/ApiApplication;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->fillHeader()V

    return-void
.end method

.method static synthetic access$802(Lcom/vkontakte/android/fragments/GameCardFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$902(Lcom/vkontakte/android/fragments/GameCardFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p1, "x1"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->groupId:I

    return p1
.end method

.method public static createArgs(Lcom/vkontakte/android/data/ApiApplication;ILjava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2
    .param p0, "application"    # Lcom/vkontakte/android/data/ApiApplication;
    .param p1, "index"    # I
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "clickSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 456
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 457
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "app"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 458
    const-string/jumbo v1, "app_index_in_list"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 459
    const-string/jumbo v1, "visitSource"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    const-string/jumbo v1, "clickSource"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    return-object v0
.end method

.method private fillHeader()V
    .locals 3

    .prologue
    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->imageViewIcon:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewName:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewGenre:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->buttonPlay:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 317
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    iget-object v0, v0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->imageViewIcon:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    const/high16 v2, 0x42400000    # 48.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 320
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewName:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 321
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewGenre:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/data/ApiApplication;->genre:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->buttonPlay:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/data/ApiApplication;->installedOnDevice:Z

    if-eqz v0, :cond_2

    const v0, 0x7f080272

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 324
    :cond_1
    return-void

    .line 322
    :cond_2
    const v0, 0x7f08025d

    goto :goto_0
.end method

.method private getApplicationIndex()I
    .locals 2

    .prologue
    .line 305
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "app_index_in_list"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic lambda$onViewCreated$0(Landroid/view/GestureDetector;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p0, "gestureDetector"    # Landroid/view/GestureDetector;
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 245
    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method private loadWall(II)V
    .locals 7
    .param p1, "_offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 403
    if-gtz p1, :cond_0

    .line 404
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->offset:I

    .line 405
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->nextFrom:Ljava/lang/String;

    .line 407
    :cond_0
    const/4 v6, 0x1

    .line 408
    .local v6, "ownerOnly":Z
    new-instance v0, Lcom/vkontakte/android/api/wall/WallGet;

    iget v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->groupId:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->nextFrom:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v5

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/wall/WallGet;-><init>(ILjava/lang/String;IZLjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/GameCardFragment$9;

    invoke-direct {v1, p0, p0, p2}, Lcom/vkontakte/android/fragments/GameCardFragment$9;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;Landroid/app/Fragment;I)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 450
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 451
    return-void
.end method

.method private static removeNewsFromIterator(Ljava/util/Iterator;Lcom/vkontakte/android/NewsEntry;Ljava/util/Collection;)Z
    .locals 4
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;",
            "Lcom/vkontakte/android/NewsEntry;",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 465
    .local p0, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsEntry;>;"
    .local p2, "newsEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/NewsEntry;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 466
    .local v0, "ee":Lcom/vkontakte/android/NewsEntry;
    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v2, v3, :cond_0

    .line 467
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 468
    const/4 v1, 0x1

    .line 471
    .end local v0    # "ee":Lcom/vkontakte/android/NewsEntry;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private startHidingRequest()V
    .locals 4

    .prologue
    .line 362
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getView()Landroid/view/View;

    move-result-object v0

    .line 363
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 364
    invoke-static {p0}, Lcom/vkontakte/android/fragments/GameCardFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 370
    :cond_0
    return-void
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 1
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 268
    if-nez p1, :cond_0

    .line 269
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->refreshing:Z

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/fragments/GameCardFragment;->loadInitial(ZI)V

    .line 273
    :goto_0
    return-void

    .line 271
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/GameCardFragment;->loadWall(II)V

    goto :goto_0
.end method

.method public fadeDrawablesAndHideRequests()V
    .locals 4

    .prologue
    .line 329
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->drawablesList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vkontakte/android/data/Games;->fadeDrawables(Ljava/util/ArrayList;)V

    .line 331
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 332
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/vkontakte/android/fragments/GameCardFragment$7;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/fragments/GameCardFragment$7;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;Landroid/app/Activity;)V

    .line 345
    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/GameCardFragment$7;->start()V

    .line 347
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    .line 348
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v2, v2, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServerReal:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/GameRequest;

    .line 349
    .local v1, "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    iget-boolean v3, v1, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    if-nez v3, :cond_0

    .line 350
    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Games;->deleteRequest(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V

    .line 352
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    goto :goto_0

    .line 355
    .end local v1    # "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    :cond_1
    return-void
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 3

    .prologue
    .line 277
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    if-nez v2, :cond_0

    .line 278
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v1

    .line 279
    .local v1, "newsAdapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    new-instance v0, Lcom/vkontakte/android/fragments/GameCardFragment$MergeRecyclerAdapterProvider;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/GameCardFragment$MergeRecyclerAdapterProvider;-><init>()V

    .line 280
    .local v0, "mergeAdapter":Lcom/vkontakte/android/fragments/GameCardFragment$MergeRecyclerAdapterProvider;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/GameCardFragment$MergeRecyclerAdapterProvider;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 281
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/GameCardFragment$MergeRecyclerAdapterProvider;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 282
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 284
    .end local v0    # "mergeAdapter":Lcom/vkontakte/android/fragments/GameCardFragment$MergeRecyclerAdapterProvider;
    .end local v1    # "newsAdapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    return-object v2
.end method

.method public getApplication()Lcom/vkontakte/android/data/ApiApplication;
    .locals 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    if-nez v0, :cond_0

    .line 299
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "app"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 301
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    return-object v0
.end method

.method protected getListReferrer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 263
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getPostsOffset()I
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->getItemCount()I

    move-result v0

    goto :goto_0
.end method

.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 258
    const-string/jumbo v0, "wall_game"

    return-object v0
.end method

.method synthetic lambda$onViewCreated$1(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 250
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 251
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "visitSource"

    const-string/jumbo v5, "direct"

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "clickSource"

    const-string/jumbo v6, "catalog"

    invoke-static {v4, v5, v6}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 250
    invoke-static {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/data/Games;->open(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$startHidingRequest$2()V
    .locals 1

    .prologue
    .line 365
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 366
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->fadeDrawablesAndHideRequests()V

    .line 368
    :cond_0
    return-void
.end method

.method public loadInitial(ZI)V
    .locals 5
    .param p1, "refresh"    # Z
    .param p2, "count"    # I

    .prologue
    .line 373
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 374
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v1

    .line 375
    .local v1, "application":Lcom/vkontakte/android/data/ApiApplication;
    new-instance v2, Lcom/vkontakte/android/api/apps/AppsGetGamePage;

    iget v3, v1, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/apps/AppsGetGamePage;-><init>(ILcom/vkontakte/android/data/db/Database;)V

    new-instance v3, Lcom/vkontakte/android/fragments/GameCardFragment$8;

    invoke-direct {v3, p0, p0, v0, p2}, Lcom/vkontakte/android/fragments/GameCardFragment$8;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;Landroid/app/Fragment;Landroid/app/Activity;I)V

    .line 376
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/apps/AppsGetGamePage;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 399
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 400
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "reqCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x0

    .line 155
    const/16 v1, 0xf3f

    if-ne p1, v1, :cond_0

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 156
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 157
    .local v0, "b":Landroid/os/Bundle;
    new-instance v1, Lcom/vkontakte/android/api/apps/SDKAppSendRequest;

    const-string/jumbo v2, "uid"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-direct {v1, v2, v4, v4, v3}, Lcom/vkontakte/android/api/apps/SDKAppSendRequest;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Lcom/vkontakte/android/fragments/GameCardFragment$5;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/GameCardFragment$5;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    .line 158
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/apps/SDKAppSendRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 175
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 179
    .end local v0    # "b":Landroid/os/Bundle;
    :goto_0
    return-void

    .line 177
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/PostListFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 194
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 195
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.games.DELETE_REQUEST_ALL"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 196
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiverReloadInstalled:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.games.RELOAD_INSTALLED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 197
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.games.RELOAD_REQUESTS"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 198
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/CardItemDecorator;
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 721
    iget v5, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->scrW:I

    const/16 v6, 0x39c

    if-lt v5, v6, :cond_0

    move v1, v3

    .line 722
    .local v1, "isTabletDecorator":Z
    :goto_0
    new-instance v0, Lcom/vkontakte/android/ui/CardItemDecorator;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v1, :cond_1

    :goto_1
    invoke-direct {v0, v5, v3}, Lcom/vkontakte/android/ui/CardItemDecorator;-><init>(Landroid/support/v7/widget/RecyclerView;Z)V

    .line 723
    .local v0, "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v5, 0x40400000    # 3.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-virtual {v0, v3, v5, v6, v4}, Lcom/vkontakte/android/ui/CardItemDecorator;->setPadding(IIII)V

    .line 724
    if-eqz v1, :cond_2

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 725
    .local v2, "pad":I
    :goto_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3, v2, v4, v2, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 726
    return-object v0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    .end local v1    # "isTabletDecorator":Z
    .end local v2    # "pad":I
    :cond_0
    move v1, v4

    .line 721
    goto :goto_0

    .restart local v1    # "isTabletDecorator":Z
    :cond_1
    move v3, v4

    .line 722
    goto :goto_1

    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    :cond_2
    move v2, v4

    .line 724
    goto :goto_2
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 185
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 186
    .local v0, "view":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->iOnListViewCreated:Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->iOnListViewCreated:Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplicationIndex()I

    move-result v3

    invoke-interface {v1, v2, v3}, Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;->onRecycleViewCreated(Lme/grishka/appkit/views/UsableRecyclerView;I)V

    .line 189
    :cond_0
    return-object v0
.end method

.method protected onDataLoaded(Ljava/util/List;Z)V
    .locals 5
    .param p2, "more"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    const/4 v2, 0x0

    .line 289
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->data:Ljava/util/ArrayList;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 290
    .local v1, "sizeAll":I
    :goto_0
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 291
    .local v0, "size":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->gameAdapter:Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    add-int v4, v1, v0

    if-lez v4, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-virtual {v3, v2}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->build(Z)V

    .line 292
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 293
    return-void

    .end local v0    # "size":I
    .end local v1    # "sizeAll":I
    :cond_1
    move v1, v2

    .line 289
    goto :goto_0

    .restart local v1    # "sizeAll":I
    :cond_2
    move v0, v2

    .line 290
    goto :goto_1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 204
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiverReloadInstalled:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 205
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    :goto_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDestroy()V

    .line 210
    return-void

    .line 206
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 214
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDestroyView()V

    .line 215
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->imageViewIcon:Lcom/vk/imageloader/view/VKImageView;

    .line 216
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewName:Landroid/widget/TextView;

    .line 217
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->buttonPlay:Landroid/widget/TextView;

    .line 218
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewGenre:Landroid/widget/TextView;

    .line 219
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 148
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onResume()V

    .line 149
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "notification"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 150
    .local v0, "nm":Landroid/app/NotificationManager;
    const/16 v1, 0x1f8

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 151
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v4, 0x7f1002c5

    const/4 v3, 0x0

    .line 223
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 224
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 225
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {v1, v3, v3}, Landroid/support/v7/widget/Toolbar;->setContentInsetsAbsolute(II)V

    .line 227
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->setRefreshEnabled(Z)V

    .line 229
    const v1, 0x7f1002c4

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 230
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/GameCardFragment$6;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/GameCardFragment$6;-><init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 245
    .local v0, "gestureDetector":Landroid/view/GestureDetector;
    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment$$Lambda$1;->lambdaFactory$(Landroid/view/GestureDetector;)Landroid/view/View$OnTouchListener;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 246
    const v1, 0x1020006

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->imageViewIcon:Lcom/vk/imageloader/view/VKImageView;

    .line 247
    const v1, 0x1020014

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewName:Landroid/widget/TextView;

    .line 248
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->buttonPlay:Landroid/widget/TextView;

    .line 249
    const v1, 0x1020015

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->textViewGenre:Landroid/widget/TextView;

    .line 250
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/GameCardFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/GameCardFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 253
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->fillHeader()V

    .line 254
    return-void
.end method

.method public setOnListViewCreated(Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;)V
    .locals 2
    .param p1, "iOnListViewCreated"    # Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;

    .prologue
    .line 309
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->iOnListViewCreated:Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;

    .line 310
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplicationIndex()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;->onRecycleViewCreated(Lme/grishka/appkit/views/UsableRecyclerView;I)V

    .line 313
    :cond_0
    return-void
.end method
