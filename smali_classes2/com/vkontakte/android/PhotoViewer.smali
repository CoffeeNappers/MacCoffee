.class public Lcom/vkontakte/android/PhotoViewer;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Lcom/vkontakte/android/ui/PhotoView$DismissListener;
.implements Lcom/vkontakte/android/ui/PhotoView$NavigationListener;
.implements Lcom/vkontakte/android/ui/ActivityResulter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/PhotoViewer$TagOverlayView;,
        Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;,
        Lcom/vkontakte/android/PhotoViewer$PhotoLoader;,
        Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;,
        Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;,
        Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;
    }
.end annotation


# static fields
.field public static final ACTION_UPDATE_ALBUM_COVER:Ljava/lang/String; = "com.vkontakte.android.UPDATE_ALBUM_COVER"

.field public static final ACTION_UPDATE_PHOTO:Ljava/lang/String; = "com.vkontakte.android.UPDATE_PHOTO"

.field private static final SELECT_ALBUM_RESULT:I = 0x3ff


# instance fields
.field private activity:Landroid/app/Activity;

.field private adapter:Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;

.field private bottomView:Landroid/view/View;

.field private buttonClickListener:Landroid/view/View$OnClickListener;

.field private callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

.field private comments:Lcom/vkontakte/android/ui/OverlayTextView;

.field private contentView:Landroid/widget/FrameLayout;

.field private controlsVisible:Z

.field private curPhoto:Lcom/vkontakte/android/Photo;

.field public curPos:I

.field private currentVisAnim:Landroid/animation/Animator;

.field private description:Landroid/widget/TextView;

.field private detector:Landroid/view/GestureDetector;

.field private displayTotal:I

.field private docUrl:Ljava/lang/String;

.field private fromAlbumId:I

.field private fromAlbumOwner:I

.field private isAdmin:Z

.field private likes:Lcom/vkontakte/android/ui/OverlayTextView;

.field private liking:Z

.field private location:Landroid/widget/TextView;

.field private photoInfoReq:Lme/grishka/appkit/api/APIRequest;

.field private photoLoaded:Z

.field private photoView:Lcom/vkontakte/android/ui/PhotoView;

.field private photos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;"
        }
    .end annotation
.end field

.field private prevBgAlpha:F

.field private reposts:Lcom/vkontakte/android/ui/OverlayTextView;

.field private scrim:Landroid/view/View;

.field private tags:Lcom/vkontakte/android/ui/OverlayTextView;

.field private tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

.field private title:Ljava/lang/String;

.field private tmpRect:Landroid/graphics/Rect;

.field private tmpRect2:Landroid/graphics/Rect;

.field private toolbar:Landroid/support/v7/widget/Toolbar;

.field useBig:Z

.field useSmall:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "docUrl"    # Ljava/lang/String;
    .param p3, "docTitle"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 241
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    .line 133
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    .line 140
    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->controlsVisible:Z

    .line 141
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/PhotoViewer;->prevBgAlpha:F

    .line 156
    new-instance v0, Lcom/vkontakte/android/PhotoViewer$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/PhotoViewer$1;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->buttonClickListener:Landroid/view/View$OnClickListener;

    .line 181
    new-instance v0, Landroid/view/GestureDetector;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    new-instance v4, Lcom/vkontakte/android/PhotoViewer$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/PhotoViewer$2;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-direct {v0, v3, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->detector:Landroid/view/GestureDetector;

    .line 214
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "activity"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    const/16 v3, 0x14

    if-ge v0, v3, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer;->useSmall:Z

    .line 215
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "activity"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    const/16 v3, 0x64

    if-lt v0, v3, :cond_2

    sget v0, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v3, 0x40000000    # 2.0f

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 216
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v0, v0, 0xf

    const/4 v3, 0x3

    if-eq v0, v3, :cond_0

    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 217
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v0, v0, 0xf

    const/4 v3, 0x4

    if-ne v0, v3, :cond_2

    :cond_0
    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->useBig:Z

    .line 242
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 243
    new-instance v0, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;

    invoke-direct {v0}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    .line 244
    iput-object p3, p0, Lcom/vkontakte/android/PhotoViewer;->title:Ljava/lang/String;

    .line 245
    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer;->docUrl:Ljava/lang/String;

    .line 246
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    new-instance v1, Lcom/vkontakte/android/Photo;

    invoke-direct {v1}, Lcom/vkontakte/android/Photo;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    invoke-direct {p0, v2}, Lcom/vkontakte/android/PhotoViewer;->initView(I)V

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->title:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/PhotoViewer;->setTitle(Ljava/lang/String;)V

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 250
    return-void

    :cond_1
    move v0, v2

    .line 214
    goto :goto_0

    :cond_2
    move v1, v2

    .line 217
    goto :goto_1
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p3, "pos"    # I
    .param p4, "callback"    # Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;I",
            "Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "photos":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    .line 133
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    .line 140
    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->controlsVisible:Z

    .line 141
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/PhotoViewer;->prevBgAlpha:F

    .line 156
    new-instance v0, Lcom/vkontakte/android/PhotoViewer$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/PhotoViewer$1;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->buttonClickListener:Landroid/view/View$OnClickListener;

    .line 181
    new-instance v0, Landroid/view/GestureDetector;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    new-instance v4, Lcom/vkontakte/android/PhotoViewer$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/PhotoViewer$2;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-direct {v0, v3, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->detector:Landroid/view/GestureDetector;

    .line 214
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "activity"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    const/16 v3, 0x14

    if-ge v0, v3, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer;->useSmall:Z

    .line 215
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "activity"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    const/16 v3, 0x64

    if-lt v0, v3, :cond_2

    sget v0, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v3, 0x40000000    # 2.0f

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 216
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v0, v0, 0xf

    const/4 v3, 0x3

    if-eq v0, v3, :cond_0

    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 217
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v0, v0, 0xf

    const/4 v3, 0x4

    if-ne v0, v3, :cond_2

    :cond_0
    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->useBig:Z

    .line 228
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 229
    iput-object p4, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 231
    invoke-direct {p0, p3}, Lcom/vkontakte/android/PhotoViewer;->initView(I)V

    .line 232
    return-void

    :cond_1
    move v0, v2

    .line 214
    goto :goto_0

    :cond_2
    move v1, v2

    .line 217
    goto :goto_1
.end method

.method static synthetic access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/PhotoViewer;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p1, "x1"    # Z

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/vkontakte/android/PhotoViewer;->like(Z)V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/PhotoViewer;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->scrim:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/PhotoViewer;)Landroid/support/v7/widget/Toolbar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/PhotoViewer;)Landroid/view/GestureDetector;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->detector:Landroid/view/GestureDetector;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->doDismiss()V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/PhotoViewer;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/PhotoViewer;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer;->photoInfoReq:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->description:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->openComments()V

    return-void
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->likes:Lcom/vkontakte/android/ui/OverlayTextView;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->comments:Lcom/vkontakte/android/ui/OverlayTextView;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tags:Lcom/vkontakte/android/ui/OverlayTextView;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->reposts:Lcom/vkontakte/android/ui/OverlayTextView;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->deletePhoto()V

    return-void
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->editDescription()V

    return-void
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->movePhoto()V

    return-void
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->makeCover()V

    return-void
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->broadcastUpdate()V

    return-void
.end method

.method static synthetic access$2902(Lcom/vkontakte/android/PhotoViewer;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p1, "x1"    # Z

    .prologue
    .line 118
    iput-boolean p1, p0, Lcom/vkontakte/android/PhotoViewer;->liking:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->showTags()V

    return-void
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->doShowTags()V

    return-void
.end method

.method static synthetic access$3102(Lcom/vkontakte/android/PhotoViewer;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p1, "x1"    # Landroid/animation/Animator;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer;->currentVisAnim:Landroid/animation/Animator;

    return-object p1
.end method

.method static synthetic access$3200(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->docUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3302(Lcom/vkontakte/android/PhotoViewer;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p1, "x1"    # Z

    .prologue
    .line 118
    iput-boolean p1, p0, Lcom/vkontakte/android/PhotoViewer;->photoLoaded:Z

    return p1
.end method

.method static synthetic access$3400(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->invalidateMenu()V

    return-void
.end method

.method static synthetic access$3500(Lcom/vkontakte/android/PhotoViewer;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->repost()V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->openLocation()V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->toggleControls()V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/PhotoViewer;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/PhotoView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    return-object v0
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->doDismiss()V

    return-void
.end method

.method private broadcastUpdate()V
    .locals 8

    .prologue
    const/4 v3, -0x1

    .line 1073
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v0, "com.vkontakte.android.POST_UPDATED"

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1074
    .local v7, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "post_id"

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->postID:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1075
    const-string/jumbo v0, "owner_id"

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1078
    const-string/jumbo v0, "likes"

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->nLikes:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1079
    const-string/jumbo v0, "liked"

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v1, v1, Lcom/vkontakte/android/Photo;->isLiked:Z

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1081
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v7, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1082
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->ownerID:I

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->postID:I

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->nLikes:I

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v5, v4, Lcom/vkontakte/android/Photo;->isLiked:Z

    const/4 v6, 0x0

    move v4, v3

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/cache/NewsfeedCache;->update(IIIIIZZ)V

    .line 1083
    return-void
.end method

.method private deletePhoto()V
    .locals 3

    .prologue
    .line 858
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosDelete;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->id:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/photos/PhotosDelete;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$16;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/PhotoViewer$16;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V

    .line 859
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 869
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 870
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 871
    return-void
.end method

.method private doDismiss()V
    .locals 3

    .prologue
    .line 544
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const-string/jumbo v2, "window"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 545
    .local v0, "wm":Landroid/view/WindowManager;
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 546
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 549
    .end local v0    # "wm":Landroid/view/WindowManager;
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    invoke-interface {v1}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;->onDismissed()V

    .line 550
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    check-cast v1, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v1, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 551
    return-void

    .line 547
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private doShowTags()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 1063
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    invoke-virtual {v0}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_0

    .line 1064
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;->setVisibility(I)V

    .line 1070
    :goto_0
    return-void

    .line 1067
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->toggleControls()V

    .line 1069
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;->setVisibility(I)V

    goto :goto_0
.end method

.method private editDescription()V
    .locals 5

    .prologue
    .line 896
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 897
    .local v1, "ed":Landroid/widget/EditText;
    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setLines(I)V

    .line 898
    const/16 v2, 0x33

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setGravity(I)V

    .line 899
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-object v2, v2, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 900
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 901
    const v2, 0x7f0804a5

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(I)V

    .line 902
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0801d9

    .line 903
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 904
    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0805d9

    new-instance v4, Lcom/vkontakte/android/PhotoViewer$18;

    invoke-direct {v4, p0, v1}, Lcom/vkontakte/android/PhotoViewer$18;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/widget/EditText;)V

    .line 905
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f08011f

    const/4 v4, 0x0

    .line 921
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 922
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 923
    .local v0, "dlg":Landroid/app/AlertDialog;
    new-instance v2, Lcom/vkontakte/android/PhotoViewer$19;

    invoke-direct {v2, p0, v1}, Lcom/vkontakte/android/PhotoViewer$19;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 930
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 931
    return-void
.end method

.method private getCurrentPhotoAsPost()Lcom/vkontakte/android/NewsEntry;
    .locals 2

    .prologue
    .line 1110
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/NewsEntry;-><init>(Lcom/vkontakte/android/Photo;)V

    return-object v0
.end method

.method private getTitleSafe()Ljava/lang/String;
    .locals 3

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->title:Ljava/lang/String;

    const/16 v1, 0x2f

    const/16 v2, 0x5f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initView(I)V
    .locals 11
    .param p1, "position"    # I

    .prologue
    const/4 v10, -0x1

    const/4 v9, -0x2

    const/4 v8, 0x1

    const v7, 0x7f0f0127

    const/4 v6, 0x0

    .line 257
    new-instance v2, Lcom/vkontakte/android/ui/PhotoView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/ui/PhotoView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    .line 258
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    new-instance v3, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;

    invoke-direct {v3, p0, v6}, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;-><init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/PhotoViewer$1;)V

    iput-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->adapter:Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/PhotoView;->setAdapter(Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;)V

    .line 259
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/ui/PhotoView;->setPosition(I)V

    .line 260
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2, p0}, Lcom/vkontakte/android/ui/PhotoView;->setDismissListener(Lcom/vkontakte/android/ui/PhotoView$DismissListener;)V

    .line 261
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2, p0}, Lcom/vkontakte/android/ui/PhotoView;->setNavigationListener(Lcom/vkontakte/android/ui/PhotoView$NavigationListener;)V

    .line 263
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/PhotoView;->getOverlayView()Landroid/view/View;

    move-result-object v0

    .line 264
    .local v0, "overlay":Landroid/view/View;
    new-instance v2, Lcom/vkontakte/android/PhotoViewer$3;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v2, p0, v3}, Lcom/vkontakte/android/PhotoViewer$3;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->scrim:Landroid/view/View;

    .line 311
    new-instance v2, Lcom/vkontakte/android/PhotoViewer$4;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v2, p0, v3, v0}, Lcom/vkontakte/android/PhotoViewer$4;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;Landroid/view/View;)V

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    .line 372
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 373
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 374
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v8}, Landroid/widget/FrameLayout;->setFitsSystemWindows(Z)V

    .line 375
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    const/16 v3, 0x700

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setSystemUiVisibility(I)V

    .line 376
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 377
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->scrim:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 378
    new-instance v2, Landroid/support/v7/widget/Toolbar;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v5, 0x7f0b00cc

    invoke-direct {v3, v4, v5}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v2, v3}, Landroid/support/v7/widget/Toolbar;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    .line 380
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v3, 0x7f02014f

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 381
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v3, Lcom/vkontakte/android/PhotoViewer$5;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/PhotoViewer$5;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 388
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setBackgroundColor(I)V

    .line 389
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v3, 0x7f0b01e7

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setPopupTheme(I)V

    .line 391
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_0

    .line 392
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2}, Landroid/support/v7/widget/Toolbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/PhotoViewer$6;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/PhotoViewer$6;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 420
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x30

    invoke-direct {v4, v10, v9, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 422
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v3, 0x7f03018a

    invoke-static {v2, v3, v6}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    .line 423
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x50

    invoke-direct {v4, v10, v9, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 425
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    const v3, 0x7f100448

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/OverlayTextView;

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->likes:Lcom/vkontakte/android/ui/OverlayTextView;

    .line 426
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    const v3, 0x7f100449

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/OverlayTextView;

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->comments:Lcom/vkontakte/android/ui/OverlayTextView;

    .line 427
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    const v3, 0x7f10044b

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/OverlayTextView;

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tags:Lcom/vkontakte/android/ui/OverlayTextView;

    .line 428
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    const v3, 0x7f10044a

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/OverlayTextView;

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->reposts:Lcom/vkontakte/android/ui/OverlayTextView;

    .line 429
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    const v3, 0x7f100446

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->description:Landroid/widget/TextView;

    .line 430
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    const v3, 0x7f100447

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    .line 432
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 433
    .local v1, "res":Landroid/content/res/Resources;
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v4, 0x7f020237

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const v5, -0x66000001

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v2, v3, v6, v6, v6}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 435
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->likes:Lcom/vkontakte/android/ui/OverlayTextView;

    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v4, 0x7f0201d7

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setSrc(Landroid/graphics/drawable/Drawable;)V

    .line 436
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->comments:Lcom/vkontakte/android/ui/OverlayTextView;

    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v4, 0x7f02018f

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setSrc(Landroid/graphics/drawable/Drawable;)V

    .line 437
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tags:Lcom/vkontakte/android/ui/OverlayTextView;

    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v4, 0x7f0202c4

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setSrc(Landroid/graphics/drawable/Drawable;)V

    .line 438
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->reposts:Lcom/vkontakte/android/ui/OverlayTextView;

    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v4, 0x7f020288

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setSrc(Landroid/graphics/drawable/Drawable;)V

    .line 440
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->likes:Lcom/vkontakte/android/ui/OverlayTextView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->buttonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 441
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->comments:Lcom/vkontakte/android/ui/OverlayTextView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->buttonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 442
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tags:Lcom/vkontakte/android/ui/OverlayTextView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->buttonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 443
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->reposts:Lcom/vkontakte/android/ui/OverlayTextView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->buttonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 444
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->buttonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 446
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v8}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 447
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v8}, Landroid/widget/FrameLayout;->setFocusableInTouchMode(Z)V

    .line 448
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->requestFocus()Z

    .line 449
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    new-instance v3, Lcom/vkontakte/android/PhotoViewer$7;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/PhotoViewer$7;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 462
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 463
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/PhotoViewer;->onPositionConfirmed(I)V

    .line 464
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->loadUsers()V

    .line 465
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v3, Lcom/vkontakte/android/PhotoViewer$8;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/PhotoViewer$8;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setOnMenuItemClickListener(Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;)V

    .line 471
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->invalidateMenu()V

    .line 473
    new-instance v2, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v2, p0, v3}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    .line 474
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;->setVisibility(I)V

    .line 475
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/PhotoView;->addOverlayView(Landroid/view/View;)V

    .line 476
    return-void
.end method

.method private invalidateMenu()V
    .locals 2

    .prologue
    .line 479
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/Menu;->clear()V

    .line 480
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/PhotoViewer;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 481
    return-void
.end method

.method private like(Z)V
    .locals 9
    .param p1, "liked"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 967
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1024
    :cond_0
    :goto_0
    return-void

    .line 970
    :cond_1
    iget-object v8, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    .line 971
    .local v8, "curPhoto":Lcom/vkontakte/android/Photo;
    iput-boolean p1, v8, Lcom/vkontakte/android/Photo;->isLiked:Z

    .line 972
    if-eqz p1, :cond_2

    .line 973
    iget v0, v8, Lcom/vkontakte/android/Photo;->nLikes:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v8, Lcom/vkontakte/android/Photo;->nLikes:I

    .line 977
    :goto_1
    iget-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer;->liking:Z

    if-nez v0, :cond_0

    .line 980
    iput-boolean v5, p0, Lcom/vkontakte/android/PhotoViewer;->liking:Z

    .line 981
    new-instance v0, Lcom/vkontakte/android/api/wall/WallLike;

    iget v2, v8, Lcom/vkontakte/android/Photo;->ownerID:I

    iget v3, v8, Lcom/vkontakte/android/Photo;->id:I

    iget-object v7, v8, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    move v1, p1

    move v6, v4

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/wall/WallLike;-><init>(ZIIZIILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$21;

    invoke-direct {v1, p0, v8, p1}, Lcom/vkontakte/android/PhotoViewer$21;-><init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;Z)V

    .line 982
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallLike;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1023
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 975
    :cond_2
    iget v0, v8, Lcom/vkontakte/android/Photo;->nLikes:I

    add-int/lit8 v0, v0, -0x1

    iput v0, v8, Lcom/vkontakte/android/Photo;->nLikes:I

    goto :goto_1
.end method

.method private loadPhotoInfo()V
    .locals 5

    .prologue
    .line 709
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v1, v1, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    if-nez v1, :cond_1

    .line 710
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoInfoReq:Lme/grishka/appkit/api/APIRequest;

    if-eqz v1, :cond_0

    .line 711
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoInfoReq:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v1}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 713
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    .line 714
    .local v0, "p":Lcom/vkontakte/android/Photo;
    new-instance v1, Lcom/vkontakte/android/api/photos/PhotosGetInfo;

    iget v2, v0, Lcom/vkontakte/android/Photo;->ownerID:I

    iget v3, v0, Lcom/vkontakte/android/Photo;->id:I

    iget-object v4, v0, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/photos/PhotosGetInfo;-><init>(IILjava/lang/String;)V

    new-instance v2, Lcom/vkontakte/android/PhotoViewer$12;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/PhotoViewer$12;-><init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;)V

    .line 715
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/photos/PhotosGetInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 735
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoInfoReq:Lme/grishka/appkit/api/APIRequest;

    .line 737
    .end local v0    # "p":Lcom/vkontakte/android/Photo;
    :cond_1
    return-void
.end method

.method private loadUsers()V
    .locals 4

    .prologue
    .line 684
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 685
    .local v0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Photo;

    .line 687
    .local v1, "p":Lcom/vkontakte/android/Photo;
    iget-object v3, v1, Lcom/vkontakte/android/Photo;->user:Lcom/vkontakte/android/UserProfile;

    if-nez v3, :cond_0

    iget v3, v1, Lcom/vkontakte/android/Photo;->userID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 688
    iget v3, v1, Lcom/vkontakte/android/Photo;->userID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 691
    .end local v1    # "p":Lcom/vkontakte/android/Photo;
    :cond_1
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "LOAD USERS"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 692
    new-instance v2, Lcom/vkontakte/android/PhotoViewer$11;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/PhotoViewer$11;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-static {v0, v2}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 706
    return-void
.end method

.method private makeCover()V
    .locals 4

    .prologue
    .line 943
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosMakeCover;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->id:I

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v3, v3, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/photos/PhotosMakeCover;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$20;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/PhotoViewer$20;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V

    .line 944
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosMakeCover;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 962
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 963
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 964
    return-void
.end method

.method private movePhoto()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 934
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 935
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "select_album"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 936
    const-string/jumbo v1, "title"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v3, 0x7f080392

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 937
    const-string/jumbo v1, "uid"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 938
    const-string/jumbo v1, "only_upload"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 939
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const/16 v3, 0x3ff

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Activity;I)Z

    .line 940
    return-void
.end method

.method private openComments()V
    .locals 2

    .prologue
    .line 1027
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_0

    .line 1033
    :goto_0
    return-void

    .line 1030
    :cond_0
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->getCurrentPhotoAsPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->scrollToFirstComment()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    .line 1031
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->loadFromBeginning()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    .line 1032
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setIsPhotoViewer()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method private openLocation()V
    .locals 6

    .prologue
    .line 1116
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "geo:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v4, v4, Lcom/vkontakte/android/Photo;->lat:D

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v4, v4, Lcom/vkontakte/android/Photo;->lon:D

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "?z=18&q="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v4, v4, Lcom/vkontakte/android/Photo;->lat:D

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v4, v4, Lcom/vkontakte/android/Photo;->lon:D

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1117
    .local v0, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1121
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 1118
    :catch_0
    move-exception v1

    .line 1119
    .local v1, "x":Ljava/lang/Throwable;
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/ActivityUtils;->requireGoogleMaps(Landroid/app/Activity;Z)Z

    goto :goto_0
.end method

.method private repost()V
    .locals 3

    .prologue
    .line 1036
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    const-string/jumbo v2, "photos"

    .line 1037
    invoke-static {v1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/Photo;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    .line 1038
    invoke-static {v1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/Photo;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 1039
    invoke-virtual {v0}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 1040
    return-void
.end method

.method private savePhoto()V
    .locals 5

    .prologue
    const/16 v4, 0x7a

    const/16 v3, 0x79

    const/16 v2, 0x77

    .line 840
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->docUrl:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 841
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->title:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->docUrl:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/vk/core/util/DownloadUtils;->downloadFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 855
    :goto_0
    return-void

    .line 844
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 845
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 853
    .local v0, "url":Ljava/lang/String;
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lcom/vk/core/util/DownloadUtils;->downloadFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 846
    .end local v0    # "url":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 847
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .restart local v0    # "url":Ljava/lang/String;
    goto :goto_1

    .line 848
    .end local v0    # "url":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 849
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .restart local v0    # "url":Ljava/lang/String;
    goto :goto_1

    .line 851
    .end local v0    # "url":Ljava/lang/String;
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    const/16 v2, 0x78

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .restart local v0    # "url":Ljava/lang/String;
    goto :goto_1
.end method

.method private setBottomBarData(IIIIZLjava/lang/String;)V
    .locals 8
    .param p1, "likes"    # I
    .param p2, "comments"    # I
    .param p3, "tags"    # I
    .param p4, "reposts"    # I
    .param p5, "liked"    # Z
    .param p6, "descr"    # Ljava/lang/String;

    .prologue
    .line 740
    new-instance v0, Lcom/vkontakte/android/PhotoViewer$13;

    move-object v1, p0

    move-object v2, p6

    move v3, p5

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/PhotoViewer$13;-><init>(Lcom/vkontakte/android/PhotoViewer;Ljava/lang/String;ZIIII)V

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 753
    return-void
.end method

.method private showEditDialog()V
    .locals 5

    .prologue
    .line 874
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801d8

    .line 875
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v4, 0x7f0801d9

    .line 876
    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v4, 0x7f080391

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v4, 0x7f080345

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    new-instance v2, Lcom/vkontakte/android/PhotoViewer$17;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/PhotoViewer$17;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 892
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 893
    return-void
.end method

.method private showTags()V
    .locals 4

    .prologue
    .line 1043
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->nTags:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-object v0, v0, Lcom/vkontakte/android/Photo;->tags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 1044
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGetTags;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->id:I

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-object v3, v3, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetTags;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$22;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/PhotoViewer$22;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V

    .line 1045
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGetTags;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 1052
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 1053
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1059
    :goto_0
    return-void

    .line 1054
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-object v0, v0, Lcom/vkontakte/android/Photo;->tags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 1055
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->doShowTags()V

    goto :goto_0

    .line 1057
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v1, 0x7f0804a9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private toggleControls()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 1086
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    invoke-virtual {v1}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;->getVisibility()I

    move-result v1

    if-eq v1, v4, :cond_0

    .line 1087
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;->setVisibility(I)V

    .line 1089
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->controlsVisible:Z

    if-nez v1, :cond_4

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->controlsVisible:Z

    .line 1090
    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    iget-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->controlsVisible:Z

    if-eqz v1, :cond_5

    move v1, v3

    :goto_1
    invoke-static {v5, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1091
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->docUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1092
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    iget-boolean v5, p0, Lcom/vkontakte/android/PhotoViewer;->controlsVisible:Z

    if-eqz v5, :cond_1

    move v4, v3

    :cond_1
    invoke-static {v1, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1094
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->currentVisAnim:Landroid/animation/Animator;

    if-eqz v1, :cond_3

    .line 1095
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->currentVisAnim:Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 1097
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->scrim:Landroid/view/View;

    const-string/jumbo v5, "gradientsAlpha"

    new-array v2, v2, [I

    iget-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->controlsVisible:Z

    if-eqz v1, :cond_6

    const/16 v1, 0x99

    :goto_2
    aput v1, v2, v3

    invoke-static {v4, v5, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 1098
    .local v0, "oa":Landroid/animation/ObjectAnimator;
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1099
    new-instance v1, Lcom/vkontakte/android/PhotoViewer$23;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/PhotoViewer$23;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1105
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 1106
    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->currentVisAnim:Landroid/animation/Animator;

    .line 1107
    return-void

    .end local v0    # "oa":Landroid/animation/ObjectAnimator;
    :cond_4
    move v1, v3

    .line 1089
    goto :goto_0

    :cond_5
    move v1, v4

    .line 1090
    goto :goto_1

    :cond_6
    move v1, v3

    .line 1097
    goto :goto_2
.end method


# virtual methods
.method public appendPhotos(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 678
    .local p1, "photos":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 679
    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 680
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->loadUsers()V

    .line 681
    return-void
.end method

.method public dismiss()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 524
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v5, v5, v5, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 525
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    invoke-virtual {v1, v5, v5, v5, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 526
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/PhotoView;->getPosition()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    invoke-interface {v1, v2, v3, v4}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;->getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 527
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 528
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->adapter:Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/PhotoView;->getPosition()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->getThumb(I)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Lcom/vkontakte/android/ui/PhotoView;->setThumb(Landroid/graphics/Bitmap;Z)V

    .line 529
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    invoke-static {p0}, Lcom/vkontakte/android/PhotoViewer$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/ui/PhotoView;->animateOut(Landroid/graphics/Rect;IILjava/lang/Runnable;)V

    .line 540
    :goto_0
    return-void

    .line 531
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    const-string/jumbo v2, "alpha"

    const/4 v3, 0x1

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput v4, v3, v5

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const-wide/16 v2, 0x12c

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 532
    .local v0, "oa":Landroid/animation/ObjectAnimator;
    new-instance v1, Lcom/vkontakte/android/PhotoViewer$9;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/PhotoViewer$9;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 538
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1125
    const/16 v1, 0x3ff

    if-ne p1, v1, :cond_0

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 1126
    const-string/jumbo v1, "album"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    .line 1127
    .local v0, "album":Lcom/vkontakte/android/api/PhotoAlbum;
    new-instance v1, Lcom/vkontakte/android/api/photos/PhotosMove;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->ownerID:I

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v3, v3, Lcom/vkontakte/android/Photo;->id:I

    iget v4, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/photos/PhotosMove;-><init>(III)V

    new-instance v2, Lcom/vkontakte/android/PhotoViewer$24;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v2, p0, v3, v0}, Lcom/vkontakte/android/PhotoViewer$24;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;Lcom/vkontakte/android/api/PhotoAlbum;)V

    .line 1128
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/photos/PhotosMove;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 1144
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 1145
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1147
    .end local v0    # "album":Lcom/vkontakte/android/api/PhotoAlbum;
    :cond_0
    return-void
.end method

.method public onBackgroundAlphaChanged(F)V
    .locals 1
    .param p1, "alpha"    # F

    .prologue
    .line 571
    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->prevBgAlpha:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 578
    :goto_0
    return-void

    .line 574
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->scrim:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 575
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setAlpha(F)V

    .line 576
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->bottomView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 577
    iput p1, p0, Lcom/vkontakte/android/PhotoViewer;->prevBgAlpha:F

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 7
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v6, -0x7

    const/16 v5, -0xf

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 756
    const v0, 0x7f11000b

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 757
    const v0, 0x7f1005f0

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->id:I

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-lez v0, :cond_3

    iget-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer;->isAdmin:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    if-eq v0, v6, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    if-ne v0, v5, :cond_3

    :cond_0
    move v0, v1

    :goto_0
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 758
    const v0, 0x7f1005e8

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->id:I

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-lez v0, :cond_4

    iget-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer;->isAdmin:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_1
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 759
    const v0, 0x7f1005f2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->id:I

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-eq v0, v4, :cond_5

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->id:I

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-lez v0, :cond_5

    move v0, v1

    :goto_2
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 760
    const v0, 0x7f10000f

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->id:I

    if-eqz v0, :cond_6

    move v0, v1

    :goto_3
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 761
    const v0, 0x7f1005de

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->id:I

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-lez v0, :cond_7

    move v0, v1

    :goto_4
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 762
    const v0, 0x7f1005f3

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    const/4 v4, -0x6

    if-eq v0, v4, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    if-eq v0, v6, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->albumID:I

    if-ne v0, v5, :cond_8

    :cond_1
    move v0, v1

    :goto_5
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 763
    const v0, 0x7f1005f4

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v3, v3, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-eq v3, v4, :cond_9

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v3, v3, Lcom/vkontakte/android/Photo;->id:I

    if-eqz v3, :cond_9

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    if-lez v3, :cond_9

    :goto_6
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 764
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->docUrl:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 765
    const v0, 0x7f1005f1

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoLoaded:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 767
    :cond_2
    return-void

    :cond_3
    move v0, v2

    .line 757
    goto/16 :goto_0

    :cond_4
    move v0, v2

    .line 758
    goto/16 :goto_1

    :cond_5
    move v0, v2

    .line 759
    goto/16 :goto_2

    :cond_6
    move v0, v2

    .line 760
    goto/16 :goto_3

    :cond_7
    move v0, v2

    .line 761
    goto :goto_4

    :cond_8
    move v0, v2

    .line 762
    goto :goto_5

    :cond_9
    move v1, v2

    .line 763
    goto :goto_6
.end method

.method public onDismiss()V
    .locals 0

    .prologue
    .line 555
    invoke-virtual {p0}, Lcom/vkontakte/android/PhotoViewer;->dismiss()V

    .line 556
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 10
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v9, 0x1

    .line 770
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005f0

    if-ne v4, v5, :cond_0

    .line 771
    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v4, v4, Lcom/vkontakte/android/Photo;->albumID:I

    const/4 v5, -0x7

    if-ne v4, v5, :cond_8

    .line 772
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->editDescription()V

    .line 777
    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005f1

    if-ne v4, v5, :cond_1

    .line 778
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->savePhoto()V

    .line 780
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005e8

    if-ne v4, v5, :cond_2

    .line 781
    new-instance v4, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f080176

    .line 782
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f0801aa

    .line 783
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f080798

    new-instance v6, Lcom/vkontakte/android/PhotoViewer$14;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/PhotoViewer$14;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    .line 784
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f080433

    const/4 v6, 0x0

    .line 791
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 792
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 794
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f10000f

    if-ne v4, v5, :cond_3

    .line 795
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "https://vk.com/photo"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v5, v5, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v5, v5, Lcom/vkontakte/android/Photo;->id:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 796
    .local v3, "ln":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const-string/jumbo v5, "clipboard"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 797
    .local v0, "cm":Landroid/text/ClipboardManager;
    invoke-virtual {v0, v3}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 798
    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const v5, 0x7f080339

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 800
    .end local v0    # "cm":Landroid/text/ClipboardManager;
    .end local v3    # "ln":Ljava/lang/String;
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005de

    if-ne v4, v5, :cond_4

    .line 801
    new-instance v1, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v1}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 802
    .local v1, "e":Lcom/vkontakte/android/NewsEntry;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 803
    iget-object v4, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget-object v6, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 804
    iput v9, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 805
    new-instance v2, Landroid/content/Intent;

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const-class v5, Lcom/vkontakte/android/RepostActivity;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 806
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "post"

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 807
    const-string/jumbo v4, "msg"

    invoke-virtual {v2, v4, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 808
    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-virtual {v4, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 810
    .end local v1    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005f2

    if-ne v4, v5, :cond_5

    .line 811
    new-instance v4, Lcom/vkontakte/android/api/photos/PhotosCopy;

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v5, v5, Lcom/vkontakte/android/Photo;->ownerID:I

    iget-object v6, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v6, v6, Lcom/vkontakte/android/Photo;->id:I

    iget-object v7, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-object v7, v7, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v7}, Lcom/vkontakte/android/api/photos/PhotosCopy;-><init>(IILjava/lang/String;)V

    new-instance v5, Lcom/vkontakte/android/PhotoViewer$15;

    iget-object v6, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-direct {v5, p0, v6}, Lcom/vkontakte/android/PhotoViewer$15;-><init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V

    .line 812
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/photos/PhotosCopy;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    .line 818
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    .line 819
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 821
    :cond_5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005f3

    if-ne v4, v5, :cond_6

    .line 822
    iget v4, p0, Lcom/vkontakte/android/PhotoViewer;->fromAlbumId:I

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v5, v5, Lcom/vkontakte/android/Photo;->albumID:I

    if-ne v4, v5, :cond_9

    iget v4, p0, Lcom/vkontakte/android/PhotoViewer;->fromAlbumOwner:I

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v5, v5, Lcom/vkontakte/android/Photo;->ownerID:I

    if-ne v4, v5, :cond_9

    .line 823
    invoke-virtual {p0}, Lcom/vkontakte/android/PhotoViewer;->dismiss()V

    .line 828
    :cond_6
    :goto_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005f4

    if-ne v4, v5, :cond_7

    .line 829
    new-instance v2, Landroid/content/Intent;

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const-class v5, Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 830
    .restart local v2    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "itemID"

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v5, v5, Lcom/vkontakte/android/Photo;->id:I

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 831
    const-string/jumbo v4, "ownerID"

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v5, v5, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 832
    const-string/jumbo v4, "type"

    const-string/jumbo v5, "photo"

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 833
    const-string/jumbo v4, "refer"

    const-string/jumbo v5, "photo"

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 834
    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    invoke-virtual {v4, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 836
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_7
    return v9

    .line 774
    :cond_8
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->showEditDialog()V

    goto/16 :goto_0

    .line 825
    :cond_9
    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "vkontakte://vk.com/album"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v8, v8, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v8, v8, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1
.end method

.method public onPositionChanged(I)V
    .locals 12
    .param p1, "pos"    # I

    .prologue
    const v4, 0x7f0804fe

    const/4 v3, 0x2

    const-wide v10, -0x3f3e6c0000000000L    # -9000.0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 582
    iput p1, p0, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    .line 583
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->docUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 584
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->title:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 585
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    new-array v3, v3, [Ljava/lang/Object;

    add-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v8

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->displayTotal:I

    if-lez v0, :cond_4

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->displayTotal:I

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v9

    invoke-virtual {v2, v4, v3}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 590
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    if-le p1, v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    invoke-interface {v0}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;->isMoreAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 591
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    invoke-interface {v0}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;->loadMore()V

    .line 593
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    iput-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    .line 594
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v0, v0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    if-eqz v0, :cond_7

    .line 595
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, v0, Lcom/vkontakte/android/Photo;->nLikes:I

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v0, Lcom/vkontakte/android/Photo;->nComments:I

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v3, v0, Lcom/vkontakte/android/Photo;->nTags:I

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v4, v0, Lcom/vkontakte/android/Photo;->nReposts:I

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v5, v0, Lcom/vkontakte/android/Photo;->isLiked:Z

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-object v6, v0, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/PhotoViewer;->setBottomBarData(IIIIZLjava/lang/String;)V

    .line 599
    :goto_2
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v0, v0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    if-nez v0, :cond_2

    .line 600
    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer;->loadPhotoInfo()V

    .line 602
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->ownerID:I

    if-gez v0, :cond_8

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->userID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->ownerID:I

    neg-int v0, v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_3
    move v0, v9

    :goto_3
    iput-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer;->isAdmin:Z

    .line 603
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v0, v0, Lcom/vkontakte/android/Photo;->lat:D

    cmpl-double v0, v0, v10

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v0, v0, Lcom/vkontakte/android/Photo;->lon:D

    cmpl-double v0, v0, v10

    if-eqz v0, :cond_a

    .line 604
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 605
    iget-object v7, p0, Lcom/vkontakte/android/PhotoViewer;->curPhoto:Lcom/vkontakte/android/Photo;

    .line 606
    .local v7, "curPhoto":Lcom/vkontakte/android/Photo;
    iget-object v0, v7, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    if-nez v0, :cond_9

    .line 607
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 608
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$10;

    invoke-direct {v1, p0, v7}, Lcom/vkontakte/android/PhotoViewer$10;-><init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 656
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 663
    .end local v7    # "curPhoto":Lcom/vkontakte/android/Photo;
    :goto_4
    return-void

    .line 585
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto/16 :goto_0

    .line 587
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    new-array v3, v3, [Ljava/lang/Object;

    add-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v8

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->displayTotal:I

    if-lez v0, :cond_6

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->displayTotal:I

    :goto_5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v9

    invoke-virtual {v2, v4, v3}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    :cond_6
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_5

    .line 597
    :cond_7
    const-string/jumbo v6, ""

    move-object v0, p0

    move v1, v8

    move v2, v8

    move v3, v8

    move v4, v8

    move v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/PhotoViewer;->setBottomBarData(IIIIZLjava/lang/String;)V

    goto/16 :goto_2

    :cond_8
    move v0, v8

    .line 602
    goto :goto_3

    .line 658
    .restart local v7    # "curPhoto":Lcom/vkontakte/android/Photo;
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    iget-object v1, v7, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 661
    .end local v7    # "curPhoto":Lcom/vkontakte/android/Photo;
    :cond_a
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->location:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_4
.end method

.method public onPositionConfirmed(I)V
    .locals 0
    .param p1, "pos"    # I

    .prologue
    .line 675
    return-void
.end method

.method public onPrepareDismiss()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 560
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 561
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 562
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/PhotoView;->getPosition()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    invoke-interface {v0, v1, v2, v3}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;->getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 563
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 564
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 565
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoView;->setThumbBounds(Landroid/graphics/Rect;)V

    .line 566
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->tagsView:Lcom/vkontakte/android/PhotoViewer$TagOverlayView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer$TagOverlayView;->setVisibility(I)V

    .line 567
    return-void
.end method

.method public setAlbumIDs(II)V
    .locals 0
    .param p1, "oid"    # I
    .param p2, "aid"    # I

    .prologue
    .line 495
    iput p1, p0, Lcom/vkontakte/android/PhotoViewer;->fromAlbumOwner:I

    .line 496
    iput p2, p0, Lcom/vkontakte/android/PhotoViewer;->fromAlbumId:I

    .line 497
    return-void
.end method

.method public setDisplayTotal(I)V
    .locals 1
    .param p1, "t"    # I

    .prologue
    .line 490
    iput p1, p0, Lcom/vkontakte/android/PhotoViewer;->displayTotal:I

    .line 491
    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 492
    return-void
.end method

.method public setPosition(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 253
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/PhotoView;->setPosition(I)V

    .line 254
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 484
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer;->title:Ljava/lang/String;

    .line 485
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 486
    iget v0, p0, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 487
    return-void
.end method

.method public show()V
    .locals 9

    .prologue
    const/4 v5, 0x1

    const/4 v1, -0x1

    const/4 v7, 0x0

    .line 500
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    const-string/jumbo v3, "window"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    .line 501
    .local v6, "wm":Landroid/view/WindowManager;
    const v4, 0x10100

    .line 502
    .local v4, "windowFlags":I
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_2

    .line 503
    const/high16 v2, -0x80000000

    or-int/2addr v4, v2

    .line 507
    :cond_0
    :goto_0
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v3, 0x2

    move v2, v1

    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 512
    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->contentView:Landroid/widget/FrameLayout;

    invoke-interface {v6, v1, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 513
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v7, v7, v7, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 514
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    invoke-virtual {v1, v7, v7, v7, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 515
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->callback:Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/PhotoView;->getPosition()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    iget-object v8, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    invoke-interface {v1, v2, v3, v8}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;->getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 516
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 517
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->adapter:Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/PhotoView;->getPosition()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->getThumb(I)Landroid/graphics/Bitmap;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->adapter:Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;

    iget-object v8, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/PhotoView;->getPosition()I

    move-result v8

    invoke-virtual {v3, v8}, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->isCached(I)Z

    move-result v3

    if-nez v3, :cond_3

    :goto_1
    invoke-virtual {v1, v2, v5}, Lcom/vkontakte/android/ui/PhotoView;->setThumb(Landroid/graphics/Bitmap;Z)V

    .line 518
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->photoView:Lcom/vkontakte/android/ui/PhotoView;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lcom/vkontakte/android/PhotoViewer;->tmpRect2:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1, v2, v3, v5}, Lcom/vkontakte/android/ui/PhotoView;->animateIn(Landroid/graphics/Rect;II)V

    .line 520
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer;->activity:Landroid/app/Activity;

    check-cast v1, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v1, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 521
    return-void

    .line 504
    .end local v0    # "lp":Landroid/view/WindowManager$LayoutParams;
    :cond_2
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_0

    .line 505
    const/high16 v2, 0xc000000

    or-int/2addr v4, v2

    goto :goto_0

    .restart local v0    # "lp":Landroid/view/WindowManager$LayoutParams;
    :cond_3
    move v5, v7

    .line 517
    goto :goto_1
.end method
