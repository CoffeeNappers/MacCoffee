.class public Lcom/vkontakte/android/attachments/DocumentAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "DocumentAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;
.implements Lcom/vkontakte/android/media/AutoPlay;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/DocumentAttachment;",
            ">;"
        }
    .end annotation
.end field

.field private static final sGifs:Lcom/vkontakte/android/cache/Gifs;


# instance fields
.field public access_key:Ljava/lang/String;

.field private autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

.field private autoplay:Z

.field public did:I

.field public extension:Ljava/lang/String;

.field private failed:Z

.field private gifViewer:Lcom/vkontakte/android/gifs/GifViewer;

.field public height:I

.field private holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

.field public transient isSingle:Z

.field private lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field private final mAutoPlay:Z

.field private mPlaying:Z

.field private mPrepared:Z

.field private mTask:Lcom/vkontakte/android/background/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/background/AsyncTask",
            "<***>;"
        }
    .end annotation
.end field

.field private movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

.field public oid:I

.field public size:I

.field public thumb:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field private triedToLoad:Z

.field public url:Ljava/lang/String;

.field public final video:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field transient wasPlayed:Z

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->get()Lcom/vkontakte/android/cache/Gifs;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->sGifs:Lcom/vkontakte/android/cache/Gifs;

    .line 129
    new-instance v0, Lcom/vkontakte/android/attachments/DocumentAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/Document;)V
    .locals 1
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 97
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 65
    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->allowAutoPlay()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mAutoPlay:Z

    .line 98
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    .line 99
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    .line 100
    iget v0, p1, Lcom/vkontakte/android/api/Document;->size:I

    iput v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    .line 101
    iget v0, p1, Lcom/vkontakte/android/api/Document;->oid:I

    iput v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->oid:I

    .line 102
    iget v0, p1, Lcom/vkontakte/android/api/Document;->did:I

    iput v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->did:I

    .line 103
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    .line 104
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    .line 105
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->video:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    .line 106
    iget v0, p1, Lcom/vkontakte/android/api/Document;->width:I

    iput v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    .line 107
    iget v0, p1, Lcom/vkontakte/android/api/Document;->height:I

    iput v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    .line 108
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->access_key:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 12
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 116
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    .line 117
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v2

    .line 118
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    .line 119
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v4

    .line 120
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    .line 121
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    .line 122
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v7

    .line 123
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v8

    .line 124
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v9

    .line 125
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v10

    .line 126
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v11

    move-object v0, p0

    .line 116
    invoke-direct/range {v0 .. v11}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    .line 127
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    .locals 1
    .param p1, "_title"    # Ljava/lang/String;
    .param p2, "_url"    # Ljava/lang/String;
    .param p3, "_size"    # I
    .param p4, "_thumb"    # Ljava/lang/String;
    .param p5, "_oid"    # I
    .param p6, "_did"    # I
    .param p7, "ext"    # Ljava/lang/String;
    .param p8, "_video"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "_width"    # I
    .param p10, "_height"    # I
    .param p11, "access_key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 65
    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->allowAutoPlay()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mAutoPlay:Z

    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    .line 81
    iput-object p2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    .line 82
    iput p3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    .line 83
    iput-object p4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    .line 84
    iput p5, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->oid:I

    .line 85
    iput p6, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->did:I

    .line 86
    iput-object p7, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    .line 87
    iput-object p8, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    .line 88
    iput p9, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    .line 89
    iput p10, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    .line 90
    iput-object p11, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->access_key:Ljava/lang/String;

    .line 95
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    return-object v0
.end method

.method static synthetic access$100()Lcom/vkontakte/android/cache/Gifs;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->sGifs:Lcom/vkontakte/android/cache/Gifs;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/gifs/GifViewer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->gifViewer:Lcom/vkontakte/android/gifs/GifViewer;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/gifs/GifViewer;)Lcom/vkontakte/android/gifs/GifViewer;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p1, "x1"    # Lcom/vkontakte/android/gifs/GifViewer;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->gifViewer:Lcom/vkontakte/android/gifs/GifViewer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->failed:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/attachments/DocumentAttachment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->failed:Z

    return p1
.end method

.method static synthetic access$302(Lcom/vkontakte/android/attachments/DocumentAttachment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPrepared:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/ui/animation/MovieDrawable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p1, "x1"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mAutoPlay:Z

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/attachments/DocumentAttachment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPlaying:Z

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vk/core/widget/LifecycleHandler;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    return-object v0
.end method

.method static synthetic access$802(Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vk/core/widget/LifecycleHandler;)Lcom/vk/core/widget/LifecycleHandler;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p1, "x1"    # Lcom/vk/core/widget/LifecycleHandler;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    return-object p1
.end method

.method static synthetic access$900(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->triedToLoad:Z

    return v0
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 227
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 232
    :cond_1
    :goto_0
    return-void

    .line 230
    :cond_2
    const v0, 0x7f1001df

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v0, p1

    .line 231
    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public canAutoPlay()Z
    .locals 1

    .prologue
    .line 258
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->isSingle:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public detachSurface()V
    .locals 0

    .prologue
    .line 254
    return-void
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 142
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    return-object v0
.end method

.method public getPercentageOnScreen()F
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 343
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    if-nez v1, :cond_1

    .line 348
    :cond_0
    :goto_0
    return v0

    .line 345
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-ne v1, p0, :cond_0

    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->getPercentageOnScreen()F

    move-result v0

    goto :goto_0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 482
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getPosition()I

    move-result v0

    goto :goto_0
.end method

.method public getScreenCenterDistance()I
    .locals 2

    .prologue
    const/4 v0, -0x1

    .line 332
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    if-nez v1, :cond_1

    .line 337
    :cond_0
    :goto_0
    return v0

    .line 334
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-ne v1, p0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->getScreenCenterDistance()I

    move-result v0

    goto :goto_0
.end method

.method public getType()Lcom/vkontakte/android/media/AutoPlay$Type;
    .locals 1

    .prologue
    .line 248
    sget-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->GIF:Lcom/vkontakte/android/media/AutoPlay$Type;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .prologue
    const/high16 v5, 0x41000000    # 8.0f

    .line 149
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    .line 150
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 151
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-boolean v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->isSingle:Z

    if-eqz v3, :cond_3

    .line 152
    if-nez p2, :cond_1

    const-string/jumbo v3, "animation"

    invoke-static {p1, v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 153
    .local v2, "vav":Landroid/view/View;
    :goto_0
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    if-nez v3, :cond_2

    .line 154
    :cond_0
    new-instance v3, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;-><init>(Landroid/view/View;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    .line 155
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 159
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-virtual {v3, p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->bind(Lcom/vkontakte/android/attachments/DocumentAttachment;)V

    .line 185
    .end local v2    # "vav":Landroid/view/View;
    :goto_2
    return-object v2

    :cond_1
    move-object v2, p2

    .line 152
    goto :goto_0

    .line 157
    .restart local v2    # "vav":Landroid/view/View;
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iput-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    goto :goto_1

    .line 162
    .end local v2    # "vav":Landroid/view/View;
    :cond_3
    const-string/jumbo v3, "doc_thumb"

    invoke-static {p1, v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DocAttachView;

    .line 163
    .local v0, "av":Lcom/vkontakte/android/DocAttachView;
    new-instance v3, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/DocAttachView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/DocAttachView;->setData(Lcom/vkontakte/android/attachments/DocumentAttachment;)V

    move-object v2, v0

    .line 165
    goto :goto_2

    .line 168
    .end local v0    # "av":Lcom/vkontakte/android/DocAttachView;
    :cond_4
    if-nez p2, :cond_6

    const-string/jumbo v3, "common"

    invoke-static {p1, v3}, Lcom/vkontakte/android/attachments/DocumentAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 169
    .local v1, "v":Landroid/view/View;
    :goto_3
    const v3, 0x7f1001ef

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    const v4, 0x7f01000d

    invoke-static {p1, v4}, Lcom/vkontakte/android/ViewUtils;->getResFromTheme(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 170
    const v3, 0x7f1001dc

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    const v3, 0x7f1001dd

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0801b8

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    int-to-long v6, v5

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v6, v7, v5}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_5

    .line 173
    new-instance v3, Lcom/vkontakte/android/attachments/DocumentAttachment$2;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment$2;-><init>(Lcom/vkontakte/android/attachments/DocumentAttachment;Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_5
    move-object v2, v1

    .line 185
    goto/16 :goto_2

    .end local v1    # "v":Landroid/view/View;
    :cond_6
    move-object v1, p2

    .line 168
    goto :goto_3
.end method

.method public isComplete()Z
    .locals 1

    .prologue
    .line 273
    const/4 v0, 0x0

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 268
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPlaying:Z

    return v0
.end method

.method public isPrepared()Z
    .locals 1

    .prologue
    .line 263
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPrepared:Z

    return v0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 2

    .prologue
    .line 211
    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->isSingle:Z

    if-eqz v1, :cond_0

    .line 212
    new-instance v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>()V

    .line 213
    .local v0, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    const/4 v1, -0x1

    iput v1, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    .line 214
    const/4 v1, -0x2

    iput v1, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 217
    .end local v0    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 307
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPlaying:Z

    .line 308
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 309
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->stop()V

    .line 311
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mAutoPlay:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->gifViewer:Lcom/vkontakte/android/gifs/GifViewer;

    if-nez v0, :cond_1

    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showInitialLayout()V

    .line 314
    :cond_1
    return-void
.end method

.method public play(Z)V
    .locals 4
    .param p1, "delay"    # Z

    .prologue
    const/4 v3, 0x1

    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->gifViewer:Lcom/vkontakte/android/gifs/GifViewer;

    if-eqz v0, :cond_1

    .line 303
    :cond_0
    :goto_0
    return-void

    .line 291
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->wasPlayed:Z

    if-nez v0, :cond_2

    .line 292
    sget-object v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->sGifs:Lcom/vkontakte/android/cache/Gifs;

    iget v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->did:I

    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->autoplay:Z

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/cache/Gifs;->trackPlayEvent(IZ)V

    .line 294
    :cond_2
    iput-boolean v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->wasPlayed:Z

    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->start()V

    .line 297
    iput-boolean v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPlaying:Z

    .line 298
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 300
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showDone()V

    goto :goto_0
.end method

.method public prepare()V
    .locals 1

    .prologue
    .line 278
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->start(Z)V

    .line 279
    return-void
.end method

.method public removeListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/media/AutoPlay$Listener;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    if-ne v0, p1, :cond_0

    .line 242
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    .line 244
    :cond_0
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 191
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 192
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 193
    iget v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 194
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 195
    iget v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->oid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 196
    iget v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->did:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 199
    iget v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 200
    iget v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->access_key:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 202
    return-void
.end method

.method public setListener(Lcom/vkontakte/android/media/AutoPlay$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/media/AutoPlay$Listener;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->autoPlayListener:Lcom/vkontakte/android/media/AutoPlay$Listener;

    .line 237
    return-void
.end method

.method start(Z)V
    .locals 5
    .param p1, "autoplay"    # Z

    .prologue
    const/4 v4, 0x1

    .line 353
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/AsyncTask;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 479
    :goto_0
    return-void

    .line 356
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    if-eqz v0, :cond_1

    .line 357
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->holder:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->cancel()V

    .line 359
    :cond_1
    iput-boolean v4, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->triedToLoad:Z

    .line 360
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->autoplay:Z

    .line 361
    new-instance v0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$3;-><init>(Lcom/vkontakte/android/attachments/DocumentAttachment;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    aput-object v3, v1, v2

    .line 478
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    goto :goto_0
.end method

.method public stop()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 318
    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPlaying:Z

    .line 319
    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mPrepared:Z

    .line 320
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    if-eqz v0, :cond_0

    .line 321
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/AsyncTask;->cancel()V

    .line 322
    iput-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->mTask:Lcom/vkontakte/android/background/AsyncTask;

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_1

    .line 325
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->recycle()V

    .line 326
    iput-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->movieDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .line 328
    :cond_1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "doc"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->did:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->access_key:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment;->access_key:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public waiting()V
    .locals 0

    .prologue
    .line 284
    return-void
.end method
