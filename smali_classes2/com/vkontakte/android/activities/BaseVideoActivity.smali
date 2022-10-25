.class public abstract Lcom/vkontakte/android/activities/BaseVideoActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "BaseVideoActivity.java"


# static fields
.field protected static interpolatorIn:Landroid/view/animation/Interpolator;

.field protected static interpolatorOut:Landroid/view/animation/Interpolator;


# instance fields
.field addMenu:Landroid/support/v7/widget/PopupMenu;

.field protected addedID:I

.field private adding:Z

.field bottomPanel:Landroid/view/View;

.field protected changingSysUiVisibility:Z

.field private errorCode:I

.field private file:Lcom/vkontakte/android/api/VideoFile;

.field private fileIndex:I

.field hideInitialUI:Z

.field landscape:Z

.field private loadLikes:Z

.field private post:Lcom/vkontakte/android/NewsEntry;

.field private final receiver:Landroid/content/BroadcastReceiver;

.field referrer:Ljava/lang/String;

.field protected systemUILayoutFlag:I

.field toolbar:Landroid/support/v7/widget/Toolbar;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .prologue
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    .line 70
    new-instance v1, Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    const-wide v2, 0x3fe28f5c28f5c28fL    # 0.58

    const-wide v4, 0x3fe8a3d70a3d70a4L    # 0.77

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/ui/CubicBezierInterpolator;-><init>(DDDD)V

    sput-object v1, Lcom/vkontakte/android/activities/BaseVideoActivity;->interpolatorIn:Landroid/view/animation/Interpolator;

    .line 71
    new-instance v5, Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    const-wide/16 v8, 0x0

    const-wide v10, 0x3fdeb851eb851eb8L    # 0.48

    const-wide v12, 0x3fd51eb851eb851fL    # 0.33

    invoke-direct/range {v5 .. v13}, Lcom/vkontakte/android/ui/CubicBezierInterpolator;-><init>(DDDD)V

    sput-object v5, Lcom/vkontakte/android/activities/BaseVideoActivity;->interpolatorOut:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 72
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->updateConfiguration(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->landscape:Z

    .line 73
    new-instance v0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$1;-><init>(Lcom/vkontakte/android/activities/BaseVideoActivity;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->receiver:Landroid/content/BroadcastReceiver;

    .line 103
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->fileIndex:I

    .line 115
    const/16 v0, 0x700

    iput v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->systemUILayoutFlag:I

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/NewsEntry;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->post:Lcom/vkontakte/android/NewsEntry;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/activities/BaseVideoActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->updateAddedState()V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/activities/BaseVideoActivity;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->setVideo(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method

.method static synthetic access$402(Lcom/vkontakte/android/activities/BaseVideoActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 68
    iput-boolean p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->adding:Z

    return p1
.end method

.method private copyLink()V
    .locals 4

    .prologue
    .line 423
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "https://vk.com/video"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 424
    .local v1, "ln":Ljava/lang/String;
    const-string/jumbo v2, "clipboard"

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 425
    .local v0, "cm":Landroid/text/ClipboardManager;
    invoke-virtual {v0, v1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 426
    const v2, 0x7f080339

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 427
    return-void
.end method

.method private initSystemView()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 533
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 534
    .local v0, "window":Landroid/view/Window;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_2

    .line 535
    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 536
    invoke-virtual {v0, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 537
    invoke-virtual {v0, v3}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 541
    :cond_0
    :goto_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-ge v1, v2, :cond_1

    .line 542
    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 544
    :cond_1
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->systemUILayoutFlag:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 545
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-static {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/view/Window;)Landroid/view/View$OnSystemUiVisibilityChangeListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    .line 557
    return-void

    .line 538
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_0

    .line 539
    const/high16 v1, 0xc000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0
.end method

.method private openInBrowser()V
    .locals 4

    .prologue
    .line 430
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "https://vk.com/video"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 431
    .local v1, "ln":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 432
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 433
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->startActivity(Landroid/content/Intent;)V

    .line 434
    const/high16 v2, 0x10a0000

    const v3, 0x10a0001

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/activities/BaseVideoActivity;->overridePendingTransition(II)V

    .line 435
    return-void
.end method

.method private openPost()V
    .locals 3

    .prologue
    .line 445
    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->referrer:Ljava/lang/String;

    .line 446
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 447
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->resetScroll(Z)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v1

    .line 448
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 449
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "from_video"

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v2}, Lcom/vkontakte/android/api/VideoFile;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 450
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->startActivity(Landroid/content/Intent;)V

    .line 451
    return-void
.end method

.method private openShareDialog()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 411
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 412
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 413
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v3, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v4, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {v3, v4}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 414
    iput v5, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 415
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/RepostActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 416
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "post"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 417
    const-string/jumbo v2, "msg"

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 418
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->startActivity(Landroid/content/Intent;)V

    .line 419
    return-void
.end method

.method private report()V
    .locals 3

    .prologue
    .line 402
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 403
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "itemID"

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 404
    const-string/jumbo v1, "ownerID"

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 405
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "video"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 406
    const-string/jumbo v1, "refer"

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->referrer:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 407
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->startActivity(Landroid/content/Intent;)V

    .line 408
    return-void
.end method

.method private setVideo(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 1
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 454
    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    .line 455
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->convertToPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->post:Lcom/vkontakte/android/NewsEntry;

    .line 456
    return-void
.end method

.method private share()V
    .locals 3

    .prologue
    .line 438
    invoke-static {p0}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->referrer:Ljava/lang/String;

    .line 439
    invoke-static {v1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    .line 440
    invoke-static {v1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/api/VideoFile;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 441
    invoke-virtual {v0}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 442
    return-void
.end method

.method private showAddMenu()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 472
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->adding:Z

    if-nez v1, :cond_0

    .line 473
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 474
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->addToAlbum()V

    .line 514
    :cond_0
    :goto_0
    return-void

    .line 479
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_2

    .line 480
    :cond_2
    new-instance v1, Landroid/support/v7/widget/PopupMenu;

    const v2, 0x7f1000b0

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x35

    invoke-direct {v1, p0, v2, v3}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;I)V

    iput-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    .line 481
    const/4 v0, 0x0

    .line 493
    .local v0, "anchor":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    iget v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addedID:I

    if-nez v1, :cond_3

    const v1, 0x7f08074d

    :goto_1
    invoke-interface {v2, v4, v4, v4, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 494
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const/4 v2, 0x1

    const v3, 0x7f08074e

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 495
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/support/v7/widget/PopupMenu;->show()V

    .line 496
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->cancelHideUI()V

    .line 497
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getHideDelay()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideUIDelayed(I)V

    .line 498
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-static {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/view/View;)Landroid/support/v7/widget/PopupMenu$OnDismissListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/PopupMenu;->setOnDismissListener(Landroid/support/v7/widget/PopupMenu$OnDismissListener;)V

    .line 505
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-static {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;)Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    goto :goto_0

    .line 493
    :cond_3
    const v1, 0x7f08075f

    goto :goto_1
.end method

.method private updateAddedState()V
    .locals 4

    .prologue
    .line 459
    new-instance v0, Lcom/vkontakte/android/api/video/VideoIsAdded;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/video/VideoIsAdded;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/activities/BaseVideoActivity$6;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$6;-><init>(Lcom/vkontakte/android/activities/BaseVideoActivity;)V

    .line 460
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoIsAdded;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 468
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 469
    return-void
.end method

.method private updateConfiguration(Landroid/content/Context;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 521
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->updateConfiguration(Landroid/content/res/Configuration;)Z

    move-result v0

    return v0
.end method

.method private updateConfiguration(Landroid/content/res/Configuration;)Z
    .locals 2
    .param p1, "configuration"    # Landroid/content/res/Configuration;

    .prologue
    .line 517
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->landscape:Z

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method final addToAlbum()V
    .locals 3

    .prologue
    .line 368
    new-instance v0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;-><init>(Landroid/content/Context;)V

    .line 369
    .local v0, "helper":Lcom/vkontakte/android/fragments/videos/VideoAddHelper;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->showAlbumsDialog(ILcom/vkontakte/android/api/VideoFile;)V

    .line 370
    return-void
.end method

.method abstract addVideo()V
.end method

.method final addVideo(Z)V
    .locals 4
    .param p1, "completed"    # Z

    .prologue
    .line 313
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->adding:Z

    .line 314
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->cancelHideUI()V

    .line 315
    iget v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addedID:I

    if-nez v0, :cond_0

    .line 316
    new-instance v0, Lcom/vkontakte/android/api/video/VideoAdd;

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/video/VideoAdd;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/activities/BaseVideoActivity$4;

    invoke-direct {v1, p0, p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity$4;-><init>(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/content/Context;Z)V

    .line 317
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoAdd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 339
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 365
    :goto_0
    return-void

    .line 341
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/video/VideoDelete;

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/video/VideoDelete;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/activities/BaseVideoActivity$5;

    invoke-direct {v1, p0, p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity$5;-><init>(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/content/Context;Z)V

    .line 342
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 363
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method abstract bindInfo(Lcom/vkontakte/android/api/VideoFile;)V
.end method

.method abstract blockingSetUIVisibility(Z)V
.end method

.method abstract cancelHideUI()V
.end method

.method final cancelRunnable(Ljava/lang/Runnable;)Z
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 381
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method

.method abstract createUI(Landroid/os/Bundle;)V
.end method

.method final displayError(I)V
    .locals 4
    .param p1, "errCode"    # I

    .prologue
    .line 385
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->isResumedImpl()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 386
    invoke-static {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getErrorString(I)I

    move-result v0

    .line 387
    .local v0, "stringR":I
    if-eqz v0, :cond_0

    .line 388
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0801f9

    .line 389
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 390
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    invoke-static {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 391
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v2

    .line 392
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 393
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 395
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->errorCode:I

    .line 399
    .end local v0    # "stringR":I
    :goto_0
    return-void

    .line 397
    :cond_1
    iput p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->errorCode:I

    goto :goto_0
.end method

.method abstract getHideDelay()I
.end method

.method final getVideo()Lcom/vkontakte/android/api/VideoFile;
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    return-object v0
.end method

.method final getVideoIndex()I
    .locals 1

    .prologue
    .line 301
    iget v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->fileIndex:I

    return v0
.end method

.method abstract hideUIDelayed(I)V
.end method

.method synthetic lambda$displayError$3(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 391
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->finish()V

    return-void
.end method

.method synthetic lambda$displayError$4(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->finish()V

    return-void
.end method

.method synthetic lambda$initSystemView$8(Landroid/view/Window;I)V
    .locals 2
    .param p1, "window"    # Landroid/view/Window;
    .param p2, "visibility"    # I

    .prologue
    .line 546
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->changingSysUiVisibility:Z

    if-eqz v0, :cond_1

    .line 547
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->changingSysUiVisibility:Z

    .line 556
    :cond_0
    :goto_0
    return-void

    .line 550
    :cond_1
    and-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 551
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method synthetic lambda$null$7()V
    .locals 1

    .prologue
    .line 552
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->setUIVisibility(Z)V

    .line 553
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getHideDelay()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideUIDelayed(I)V

    .line 554
    return-void
.end method

.method synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->toggleLike()V

    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->share()V

    return-void
.end method

.method synthetic lambda$onCreate$2(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->openPost()V

    return-void
.end method

.method synthetic lambda$showAddMenu$5(Landroid/view/View;Landroid/support/v7/widget/PopupMenu;)V
    .locals 1
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "popupMenu"    # Landroid/support/v7/widget/PopupMenu;

    .prologue
    .line 499
    const/16 v0, 0x3e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideUIDelayed(I)V

    .line 501
    if-eqz p1, :cond_0

    .line 502
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 504
    :cond_0
    return-void
.end method

.method synthetic lambda$showAddMenu$6(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "menuItem"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 506
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 507
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->addToAlbum()V

    .line 511
    :goto_0
    return v1

    .line 509
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->addVideo()V

    goto :goto_0
.end method

.method abstract onAddedStateChanged()V
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 288
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 289
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->updateConfiguration(Landroid/content/res/Configuration;)Z

    .line 290
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v0, :cond_0

    .line 291
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->bindInfo(Lcom/vkontakte/android/api/VideoFile;)V

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/support/v7/widget/PopupMenu;)V

    .line 294
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 122
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 123
    invoke-direct {p0, p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->updateConfiguration(Landroid/content/Context;)Z

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    iput-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->convertToPost()Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->post:Lcom/vkontakte/android/NewsEntry;

    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "file_index"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->fileIndex:I

    .line 127
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "referrer"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->referrer:Ljava/lang/String;

    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "load_likes"

    iget-boolean v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->loadLikes:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->loadLikes:Z

    .line 129
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "hide_ui"

    iget-boolean v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideInitialUI:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideInitialUI:Z

    .line 130
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->createUI(Landroid/os/Bundle;)V

    .line 131
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->initSystemView()V

    .line 133
    const v0, 0x7f1001b0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    iput-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 136
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 137
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const v1, 0x7f020354

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setHomeAsUpIndicator(I)V

    .line 138
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 139
    const v0, 0x7f100590

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    const v0, 0x7f100592

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    const v0, 0x7f100591

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/activities/BaseVideoActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    const v0, 0x7f10058d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->bottomPanel:Landroid/view/View;

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->bindInfo(Lcom/vkontakte/android/api/VideoFile;)V

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 147
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->updateAddedState()V

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "com.vkontakte.android.POST_UPDATED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/activities/BaseVideoActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 150
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.VIDEO_MOVED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/VideoFile;->contentRestricted:Z

    if-eqz v0, :cond_2

    .line 154
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->displayError(I)V

    .line 209
    :cond_1
    :goto_0
    return-void

    .line 158
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isExternal()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/VideoFile;->processing:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    .line 159
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    .line 160
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 162
    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->blockingSetUIVisibility(Z)V

    .line 163
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetById;

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/video/VideoGetById;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/activities/BaseVideoActivity$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$2;-><init>(Lcom/vkontakte/android/activities/BaseVideoActivity;)V

    .line 164
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 188
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 190
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->startFile(Lcom/vkontakte/android/api/VideoFile;)V

    .line 191
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->loadLikes:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 192
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetById;

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/video/VideoGetById;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/activities/BaseVideoActivity$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/BaseVideoActivity$3;-><init>(Lcom/vkontakte/android/activities/BaseVideoActivity;)V

    .line 193
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 205
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 10
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const v7, 0x7f1000b0

    const v5, -0x6e400e

    const/4 v4, -0x1

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 229
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v6, 0x7f110014

    invoke-virtual {v1, v6, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 230
    invoke-interface {p1, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v6, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v6, v6, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 231
    const v1, 0x7f1002c9

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    iget-boolean v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->landscape:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    if-eqz v1, :cond_4

    move v1, v2

    :goto_0
    invoke-interface {v6, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 232
    const v1, 0x7f1005ff

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-boolean v6, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->landscape:Z

    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 233
    invoke-interface {p1, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    new-instance v7, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v8, 0x7f02015f

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iget v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addedID:I

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    if-ne v1, v9, :cond_5

    :cond_0
    move v1, v5

    :goto_1
    invoke-direct {v7, v8, v1}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 234
    const v1, 0x7f1005ff

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    new-instance v6, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0201d7

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v8, v8, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    if-eqz v8, :cond_6

    :goto_2
    invoke-direct {v6, v7, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 235
    const v1, 0x7f1002c9

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    new-instance v5, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f020288

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 236
    const v1, 0x7f1005f4

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v1, v5, :cond_7

    move v1, v2

    :goto_3
    invoke-interface {v4, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 237
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v2, :cond_1

    sget-object v1, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    iget-object v4, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v4, v4, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_8

    :cond_2
    move v0, v2

    .line 238
    .local v0, "canUseLink":Z
    :goto_4
    const v1, 0x7f10000f

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 239
    const v1, 0x7f1005fa

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 240
    const v1, 0x7f1005de

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v4, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget v4, v4, Lcom/vkontakte/android/api/VideoFile;->vid:I

    if-eqz v4, :cond_3

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_3

    move v3, v2

    :cond_3
    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 241
    return v2

    .end local v0    # "canUseLink":Z
    :cond_4
    move v1, v3

    .line 231
    goto/16 :goto_0

    :cond_5
    move v1, v4

    .line 233
    goto/16 :goto_1

    :cond_6
    move v5, v4

    .line 234
    goto/16 :goto_2

    :cond_7
    move v1, v3

    .line 236
    goto :goto_3

    :cond_8
    move v0, v3

    .line 237
    goto :goto_4
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 213
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 214
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 215
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 216
    return-void
.end method

.method abstract onLikeStateChanged()V
.end method

.method public final onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 246
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 280
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 283
    :goto_0
    return v0

    .line 248
    :sswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onBackPressed()V

    .line 283
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 252
    :sswitch_1
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->report()V

    goto :goto_1

    .line 256
    :sswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->toggleLike()V

    goto :goto_1

    .line 260
    :sswitch_3
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->share()V

    goto :goto_1

    .line 264
    :sswitch_4
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->showAddMenu()V

    goto :goto_1

    .line 268
    :sswitch_5
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->copyLink()V

    goto :goto_1

    .line 272
    :sswitch_6
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->openInBrowser()V

    goto :goto_1

    .line 276
    :sswitch_7
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->openShareDialog()V

    goto :goto_1

    .line 246
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f10000f -> :sswitch_5
        0x7f1000b0 -> :sswitch_4
        0x7f1002c9 -> :sswitch_3
        0x7f1005de -> :sswitch_7
        0x7f1005f4 -> :sswitch_1
        0x7f1005fa -> :sswitch_6
        0x7f1005ff -> :sswitch_2
    .end sparse-switch
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 220
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 221
    iget v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->errorCode:I

    if-eqz v0, :cond_0

    .line 222
    iget v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->errorCode:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->displayError(I)V

    .line 224
    :cond_0
    return-void
.end method

.method playEmbed()V
    .locals 3

    .prologue
    .line 525
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 526
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 527
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->startActivity(Landroid/content/Intent;)V

    .line 528
    const/high16 v1, 0x10a0000

    const v2, 0x10a0001

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->overridePendingTransition(II)V

    .line 529
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->finish()V

    .line 530
    return-void
.end method

.method final postRunnable(Ljava/lang/Runnable;I)Z
    .locals 4
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "delayMillis"    # I

    .prologue
    .line 377
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    int-to-long v2, p2

    invoke-virtual {v0, p1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v0

    return v0
.end method

.method protected setBottomPanelVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 305
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->landscape:Z

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->bottomPanel:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 310
    :goto_0
    return-void

    .line 308
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->bottomPanel:Landroid/view/View;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    goto :goto_1
.end method

.method abstract setUIVisibility(Z)V
.end method

.method abstract startFile(Lcom/vkontakte/android/api/VideoFile;)V
.end method

.method final toggleLike()V
    .locals 3

    .prologue
    .line 373
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity;->file:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const/4 v2, 0x0

    invoke-static {v1, v0, p0, v2}, Lcom/vkontakte/android/data/Posts;->like(Lcom/vkontakte/android/NewsEntry;ZLandroid/app/Activity;Ljava/lang/String;)V

    .line 374
    return-void

    .line 373
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
