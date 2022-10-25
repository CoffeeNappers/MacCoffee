.class public Lcom/vkontakte/android/ui/AttachmentsEditorView;
.super Landroid/widget/HorizontalScrollView;
.source "AttachmentsEditorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;,
        Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;
    }
.end annotation


# instance fields
.field private attachments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field private callback:Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

.field private content:Landroid/widget/LinearLayout;

.field private dragPos:I

.field private dragStartX:F

.field private dragStartY:F

.field private dragView:Landroid/view/View;

.field public forbidAttachmentsEdit:Z

.field private initTime:J

.field public isWallPhoto:Z

.field private lastTouchX:F

.field private lastTouchY:F

.field private receiver:Landroid/content/BroadcastReceiver;

.field private removeClickListener:Landroid/view/View$OnClickListener;

.field private retryClickListener:Landroid/view/View$OnClickListener;

.field private scrollRunner:Ljava/lang/Runnable;

.field public uploadOwnerId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 216
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    .line 74
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->forbidAttachmentsEdit:Z

    .line 76
    invoke-static {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    .line 77
    invoke-static {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->retryClickListener:Landroid/view/View$OnClickListener;

    .line 94
    new-instance v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->receiver:Landroid/content/BroadcastReceiver;

    .line 207
    iput v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadOwnerId:I

    .line 208
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isWallPhoto:Z

    .line 213
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->initTime:J

    .line 217
    invoke-direct {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->init()V

    .line 218
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 221
    invoke-direct {p0, p1, p2}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    .line 74
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->forbidAttachmentsEdit:Z

    .line 76
    invoke-static {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    .line 77
    invoke-static {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->retryClickListener:Landroid/view/View$OnClickListener;

    .line 94
    new-instance v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->receiver:Landroid/content/BroadcastReceiver;

    .line 207
    iput v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadOwnerId:I

    .line 208
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isWallPhoto:Z

    .line 213
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->initTime:J

    .line 222
    invoke-direct {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->init()V

    .line 223
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x0

    .line 227
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    .line 74
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->forbidAttachmentsEdit:Z

    .line 76
    invoke-static {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    .line 77
    invoke-static {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->retryClickListener:Landroid/view/View$OnClickListener;

    .line 94
    new-instance v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->receiver:Landroid/content/BroadcastReceiver;

    .line 207
    iput v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadOwnerId:I

    .line 208
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isWallPhoto:Z

    .line 213
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->initTime:J

    .line 228
    invoke-direct {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->init()V

    .line 229
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->callback:Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/ui/AttachmentsEditorView;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/AttachmentsEditorView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    return v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;
    .param p1, "x1"    # I

    .prologue
    .line 68
    iput p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    return p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/AttachmentsEditorView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragStartX:F

    return v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/ui/AttachmentsEditorView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;
    .param p1, "x1"    # F

    .prologue
    .line 68
    iput p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragStartX:F

    return p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/ui/AttachmentsEditorView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->lastTouchX:F

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/ui/AttachmentsEditorView;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;
    .param p1, "x1"    # F

    .prologue
    .line 68
    iput p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragStartY:F

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/AttachmentsEditorView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    iget v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->lastTouchY:F

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->updateDragPosition()V

    return-void
.end method

.method private addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "att"    # Lcom/vkontakte/android/attachments/Attachment;
    .param p3, "index"    # I

    .prologue
    const/high16 v6, 0x42a00000    # 80.0f

    .line 527
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 529
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->forbidAttachmentsEdit:Z

    if-eqz v1, :cond_0

    .line 530
    const v1, 0x7f1001ed

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 531
    .local v0, "removeView":Landroid/view/View;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 535
    .end local v0    # "removeView":Landroid/view/View;
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;

    invoke-direct {v2, p0, p1, p3}, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;Landroid/view/View;I)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 551
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->initTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x1f4

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getScrollX()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v6

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    int-to-double v4, p3

    cmpl-double v1, v2, v4

    if-gtz v1, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getScrollX()I

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getWidth()I

    move-result v2

    add-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v1, v6

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    int-to-double v4, p3

    cmpg-double v1, v2, v4

    if-gez v1, :cond_2

    .line 552
    :cond_1
    new-instance v1, Lcom/vkontakte/android/ui/AttachmentsEditorView$7;

    invoke-direct {v1, p0, p3}, Lcom/vkontakte/android/ui/AttachmentsEditorView$7;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)V

    const-wide/16 v2, 0x96

    invoke-virtual {p0, v1, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 559
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_3

    .line 560
    new-instance v1, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$8;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 585
    :cond_3
    return-void
.end method

.method private canReorder(Lcom/vkontakte/android/attachments/Attachment;Lcom/vkontakte/android/attachments/Attachment;)Z
    .locals 3
    .param p1, "a"    # Lcom/vkontakte/android/attachments/Attachment;
    .param p2, "b"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 779
    instance-of v2, p1, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    if-eqz v2, :cond_1

    .line 803
    :cond_0
    :goto_0
    return v0

    .line 782
    :cond_1
    instance-of v2, p1, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-nez v2, :cond_0

    .line 785
    instance-of v2, p1, Lcom/vkontakte/android/attachments/AlbumAttachment;

    if-eqz v2, :cond_2

    .line 786
    instance-of v0, p2, Lcom/vkontakte/android/attachments/AlbumAttachment;

    goto :goto_0

    .line 788
    :cond_2
    instance-of v2, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-nez v2, :cond_3

    instance-of v2, p1, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    if-eqz v2, :cond_5

    .line 789
    :cond_3
    instance-of v2, p2, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-nez v2, :cond_4

    instance-of v2, p2, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    if-eqz v2, :cond_0

    :cond_4
    move v0, v1

    goto :goto_0

    .line 791
    :cond_5
    instance-of v2, p1, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v2, :cond_6

    .line 792
    instance-of v0, p2, Lcom/vkontakte/android/attachments/VideoAttachment;

    goto :goto_0

    .line 794
    :cond_6
    instance-of v2, p1, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-eqz v2, :cond_7

    .line 795
    instance-of v0, p2, Lcom/vkontakte/android/attachments/AudioAttachment;

    goto :goto_0

    .line 797
    :cond_7
    instance-of v2, p1, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v2, :cond_8

    .line 798
    instance-of v0, p2, Lcom/vkontakte/android/attachments/PollAttachment;

    goto :goto_0

    .line 800
    :cond_8
    instance-of v2, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v2, :cond_9

    .line 801
    instance-of v0, p2, Lcom/vkontakte/android/attachments/DocumentAttachment;

    goto :goto_0

    .line 803
    :cond_9
    instance-of v2, p2, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-nez v2, :cond_a

    instance-of v2, p2, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-nez v2, :cond_a

    instance-of v2, p2, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-nez v2, :cond_a

    instance-of v2, p2, Lcom/vkontakte/android/attachments/PollAttachment;

    if-nez v2, :cond_a

    instance-of v2, p2, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-nez v2, :cond_a

    :goto_1
    move v0, v1

    goto :goto_0

    :cond_a
    move v1, v0

    goto :goto_1
.end method

.method private createDocumentView(Lcom/vkontakte/android/attachments/DocumentAttachment;Ljava/lang/String;)Landroid/view/View;
    .locals 4
    .param p1, "att"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 678
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f030048

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 679
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1001eb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 680
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 681
    const v1, 0x7f1001ea

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    sget-object v3, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 682
    const v1, 0x7f1001ed

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 683
    return-object v0
.end method

.method private createFwdView(I)Landroid/view/View;
    .locals 7
    .param p1, "count"    # I

    .prologue
    .line 603
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f030049

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 604
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0027

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, p1, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 605
    const v1, 0x7f1001ee

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 606
    const v1, 0x7f1001ed

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 607
    return-object v0
.end method

.method private createImagelessView(ILjava/lang/String;Ljava/lang/String;Z)Landroid/view/View;
    .locals 6
    .param p1, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "subtitle"    # Ljava/lang/String;
    .param p4, "progress"    # Z

    .prologue
    const/4 v5, 0x1

    const v4, 0x7f1001eb

    .line 588
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v2

    if-eqz p4, :cond_1

    const v1, 0x7f03004b

    :goto_0
    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 589
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 590
    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 591
    const v1, 0x7f1001ef

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 592
    if-eqz p4, :cond_0

    .line 593
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    new-instance v2, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v2, v5}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 594
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    new-instance v2, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v2, v5}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 595
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 596
    const v1, 0x7f1001ec

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->retryClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 598
    :cond_0
    const v1, 0x7f1001ed

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 599
    return-object v0

    .line 588
    .end local v0    # "v":Landroid/view/View;
    :cond_1
    const v1, 0x7f03004a

    goto :goto_0
.end method

.method private createLocalImageView(Ljava/lang/String;I)Landroid/view/View;
    .locals 5
    .param p1, "fileUri"    # Ljava/lang/String;
    .param p2, "layout"    # I

    .prologue
    const/4 v4, 0x1

    const v3, 0x7f1001eb

    .line 659
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, p2, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 660
    .local v0, "v":Landroid/view/View;
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    new-instance v2, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v2, v4}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 661
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    new-instance v2, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v2, v4}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 662
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 663
    const v1, 0x7f1001ea

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 664
    const v1, 0x7f1001ed

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 665
    const v1, 0x7f1001ec

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->retryClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 666
    return-object v0
.end method

.method private createLocationView(Lcom/vkontakte/android/attachments/GeoAttachment;)Landroid/view/View;
    .locals 9
    .param p1, "att"    # Lcom/vkontakte/android/attachments/GeoAttachment;

    .prologue
    const v6, 0x7f1001ea

    .line 687
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f03004d

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    .line 688
    .local v7, "v":Landroid/view/View;
    const v0, 0x7f1001eb

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 689
    invoke-virtual {v7, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    new-instance v1, Lcom/vk/imageloader/transform/AttachMapPinTransform;

    const/high16 v2, 0x42c00000    # 96.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    const/high16 v3, 0x42900000    # 72.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0201e9

    invoke-static {v4, v5}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/vk/imageloader/transform/AttachMapPinTransform;-><init>(IILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 690
    invoke-virtual {v7, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/vk/imageloader/view/VKImageView;

    iget-wide v0, p1, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    iget-wide v2, p1, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    const/16 v4, 0x60

    const/16 v5, 0x48

    const/16 v6, 0xe

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/Global;->getStaticMapURL(DDIII)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v8, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 691
    const v0, 0x7f1001ed

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 692
    return-object v7
.end method

.method private createMarketView(Lcom/vkontakte/android/attachments/MarketAttachment;)Landroid/view/View;
    .locals 5
    .param p1, "att"    # Lcom/vkontakte/android/attachments/MarketAttachment;

    .prologue
    const v4, 0x7f1001ed

    .line 649
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f03004c

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 650
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget-object v2, v2, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 651
    const v1, 0x7f1001f0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget-object v2, v2, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 652
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 653
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-boolean v1, p1, Lcom/vkontakte/android/attachments/MarketAttachment;->canEdit:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 654
    const v1, 0x7f1001ea

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget-object v2, v2, Lcom/vkontakte/android/data/Good;->thumb_photo:Ljava/lang/String;

    sget-object v3, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 655
    return-object v0

    .line 653
    :cond_0
    const/16 v1, 0x8

    goto :goto_0
.end method

.method private createPendingDocumentView(Lcom/vkontakte/android/attachments/DocumentAttachment;Ljava/lang/String;)Landroid/view/View;
    .locals 3
    .param p1, "att"    # Lcom/vkontakte/android/attachments/DocumentAttachment;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 643
    iget-object v1, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    const v2, 0x7f030048

    invoke-direct {p0, v1, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createLocalImageView(Ljava/lang/String;I)Landroid/view/View;

    move-result-object v0

    .line 644
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 645
    return-object v0
.end method

.method private createPhotoView(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;)Landroid/view/View;
    .locals 2
    .param p1, "att"    # Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    .prologue
    .line 639
    iget-object v0, p1, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    const v1, 0x7f03004d

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createLocalImageView(Ljava/lang/String;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private createPhotoView(Lcom/vkontakte/android/attachments/PhotoAttachment;)Landroid/view/View;
    .locals 4
    .param p1, "att"    # Lcom/vkontakte/android/attachments/PhotoAttachment;

    .prologue
    .line 670
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f03004d

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 671
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1001eb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 672
    const v1, 0x7f1001ea

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 673
    const v1, 0x7f1001ed

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 674
    return-object v0
.end method

.method private createVideoView(Lcom/vkontakte/android/attachments/VideoAttachment;)Landroid/view/View;
    .locals 9
    .param p1, "att"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const v6, 0x7f1001eb

    .line 611
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f03004e

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 612
    .local v1, "v":Landroid/view/View;
    const v2, 0x7f1001f2

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const-string/jumbo v3, "%d:%02d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v5, v5, Lcom/vkontakte/android/api/VideoFile;->duration:I

    div-int/lit8 v5, v5, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    iget-object v5, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v5, v5, Lcom/vkontakte/android/api/VideoFile;->duration:I

    rem-int/lit8 v5, v5, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 613
    const v2, 0x7f1001ea

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    .line 614
    .local v0, "imageView":Lcom/vk/imageloader/view/VKImageView;
    iget-object v2, p1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, v2, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    sget-object v3, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 616
    const v2, 0x7f1001ed

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 617
    instance-of v2, p1, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    if-eqz v2, :cond_0

    .line 618
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    new-instance v3, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v3, v8}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 619
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    new-instance v3, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v3, v8}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 620
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    invoke-virtual {v2, v7}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 621
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 622
    const v2, 0x7f1001ec

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->retryClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 624
    :cond_0
    return-object v1
.end method

.method private getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;
    .locals 8
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 628
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 629
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 635
    :goto_0
    return-object v0

    .line 631
    :cond_0
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "_data"

    aput-object v1, v2, v0

    .line 632
    .local v2, "proj":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 633
    .local v7, "cursor":Landroid/database/Cursor;
    const-string/jumbo v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 634
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 635
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 232
    new-instance v1, Lcom/vkontakte/android/ui/AttachmentsEditorView$2;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView$2;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    .line 252
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 253
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 254
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_0

    .line 255
    new-instance v0, Landroid/animation/LayoutTransition;

    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 256
    .local v0, "trans":Landroid/animation/LayoutTransition;
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 257
    invoke-direct {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->resetTransitionAnims()V

    .line 259
    .end local v0    # "trans":Landroid/animation/LayoutTransition;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addView(Landroid/view/View;)V

    .line 260
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->setFillViewport(Z)V

    .line 261
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->setHorizontalScrollBarEnabled(Z)V

    .line 262
    return-void
.end method

.method static synthetic lambda$resetTransitionAnims$2(F)F
    .locals 2
    .param p0, "input"    # F

    .prologue
    .line 271
    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x40c00000    # 6.0f

    mul-float/2addr v1, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method private resetTransitionAnims()V
    .locals 13

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v9, 0x0

    const/4 v8, 0x2

    .line 265
    iget-object v3, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v2

    .line 266
    .local v2, "trans":Landroid/animation/LayoutTransition;
    invoke-virtual {v2, v9}, Landroid/animation/LayoutTransition;->setAnimateParentHierarchy(Z)V

    .line 267
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 268
    .local v0, "animAdding":Landroid/animation/AnimatorSet;
    new-array v3, v12, [Landroid/animation/Animator;

    const-string/jumbo v4, "scaleX"

    new-array v5, v8, [F

    fill-array-data v5, :array_0

    invoke-static {v10, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v9

    const-string/jumbo v4, "scaleY"

    new-array v5, v8, [F

    fill-array-data v5, :array_1

    invoke-static {v10, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v11

    const-string/jumbo v4, "alpha"

    new-array v5, v8, [F

    fill-array-data v5, :array_2

    invoke-static {v10, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 269
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator;

    new-instance v4, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v4}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 270
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator;

    new-instance v4, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v4}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 271
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator;

    invoke-static {}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;->lambdaFactory$()Landroid/animation/TimeInterpolator;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 273
    new-instance v3, Lcom/vkontakte/android/ui/AttachmentsEditorView$3;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$3;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 280
    invoke-virtual {v2, v8, v0}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 281
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 282
    .local v1, "animRemoving":Landroid/animation/AnimatorSet;
    const/4 v3, 0x4

    new-array v3, v3, [Landroid/animation/Animator;

    const-string/jumbo v4, "scaleX"

    new-array v5, v8, [F

    fill-array-data v5, :array_3

    invoke-static {v10, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    const-wide/16 v6, 0x12c

    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v9

    const-string/jumbo v4, "scaleY"

    new-array v5, v8, [F

    fill-array-data v5, :array_4

    invoke-static {v10, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    const-wide/16 v6, 0x12c

    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v11

    const-string/jumbo v4, "rotation"

    new-array v5, v11, [F

    const/high16 v6, 0x42b40000    # 90.0f

    aput v6, v5, v9

    invoke-static {v10, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    const-wide/16 v6, 0x12c

    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v8

    const-string/jumbo v4, "alpha"

    new-array v5, v11, [F

    const/4 v6, 0x0

    aput v6, v5, v9

    invoke-static {v10, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    const-wide/16 v6, 0x12c

    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    aput-object v4, v3, v12

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 283
    new-instance v3, Lcom/vkontakte/android/ui/AttachmentsEditorView$4;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$4;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 292
    invoke-virtual {v2, v12, v1}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 293
    const-wide/16 v4, 0x96

    invoke-virtual {v2, v11, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 294
    const-wide/16 v4, 0x0

    invoke-virtual {v2, v9, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 295
    const-wide/16 v4, 0x1f4

    invoke-virtual {v2, v8, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 296
    const-wide/16 v4, 0x0

    invoke-virtual {v2, v12, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 297
    return-void

    .line 268
    :array_0
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 282
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3dcccccd    # 0.1f
    .end array-data

    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x3dcccccd    # 0.1f
    .end array-data
.end method

.method private retryUploadVideo(Lcom/vkontakte/android/attachments/PendingVideoAttachment;)V
    .locals 4
    .param p1, "att"    # Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    .prologue
    .line 711
    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/ui/AttachmentsEditorView;Lcom/vkontakte/android/attachments/PendingVideoAttachment;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-virtual {p0, v0, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 712
    return-void
.end method

.method private updateDragPosition()V
    .locals 8

    .prologue
    .line 732
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    iget v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->lastTouchX:F

    iget v6, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragStartX:F

    sub-float/2addr v5, v6

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 733
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    iget v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->lastTouchY:F

    iget v6, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragStartY:F

    sub-float/2addr v5, v6

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 734
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v5

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float v2, v4, v5

    .line 736
    .local v2, "dpos":F
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 737
    .local v3, "rdpos":I
    iget v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    if-eq v3, v4, :cond_0

    if-ltz v3, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 738
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    iget v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/Attachment;

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/Attachment;

    invoke-direct {p0, v4, v5}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->canReorder(Lcom/vkontakte/android/attachments/Attachment;Lcom/vkontakte/android/attachments/Attachment;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 739
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 740
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v4, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 741
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    iget v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 742
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    .line 743
    .local v1, "b":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4, v3, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 744
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    iget v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    invoke-virtual {v4, v5, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 745
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    sub-int v6, v3, v6

    iget-object v7, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v7

    mul-int/2addr v6, v7

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 746
    iget v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragStartX:F

    iget v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    sub-int v5, v3, v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    mul-int/2addr v5, v6

    int-to-float v5, v5

    add-float/2addr v4, v5

    iput v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragStartX:F

    .line 747
    iput v3, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragPos:I

    .line 750
    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v1    # "b":Lcom/vkontakte/android/attachments/Attachment;
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v5

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x3

    mul-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getScrollX()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_2

    .line 751
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    if-nez v4, :cond_1

    .line 752
    new-instance v4, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)V

    iput-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    .line 753
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->post(Ljava/lang/Runnable;)Z

    .line 766
    :cond_1
    :goto_0
    return-void

    .line 755
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v5

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x3

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getScrollX()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    const/4 v5, 0x0

    cmpg-float v4, v4, v5

    if-gez v4, :cond_3

    .line 756
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    if-nez v4, :cond_1

    .line 757
    new-instance v4, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;

    const/4 v5, -0x1

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)V

    iput-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    .line 758
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 761
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    if-eqz v4, :cond_1

    .line 762
    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 763
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollRunner:Ljava/lang/Runnable;

    goto :goto_0
.end method

.method private uploadAttachment(Lcom/vkontakte/android/attachments/PendingAttachment;)V
    .locals 4
    .param p1, "attachment"    # Lcom/vkontakte/android/attachments/PendingAttachment;

    .prologue
    .line 696
    new-instance v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;Lcom/vkontakte/android/attachments/PendingAttachment;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {p0, v0, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 708
    return-void
.end method


# virtual methods
.method public add(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 26
    .param p1, "att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 327
    const-string/jumbo v20, "vk"

    const-string/jumbo v21, "Attach editor add"

    invoke-static/range {v20 .. v21}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 329
    .local v12, "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    if-lez v20, :cond_9

    .line 340
    const/4 v15, 0x0

    .local v15, "photos":I
    const/4 v7, 0x0

    .local v7, "albums":I
    const/16 v19, 0x0

    .local v19, "videos":I
    const/4 v8, 0x0

    .local v8, "audios":I
    const/16 v16, 0x0

    .local v16, "polls":I
    const/4 v10, 0x0

    .local v10, "docs":I
    const/4 v14, 0x0

    .local v14, "others":I
    const/4 v11, 0x0

    .line 341
    .local v11, "fwds":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_0
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_8

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .line 342
    .local v6, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v6, Lcom/vkontakte/android/attachments/AlbumAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_0

    .line 343
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 344
    :cond_0
    instance-of v0, v6, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move/from16 v21, v0

    if-nez v21, :cond_1

    instance-of v0, v6, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_2

    .line 345
    :cond_1
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 346
    :cond_2
    instance-of v0, v6, Lcom/vkontakte/android/attachments/VideoAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_3

    .line 347
    add-int/lit8 v19, v19, 0x1

    goto :goto_0

    .line 348
    :cond_3
    instance-of v0, v6, Lcom/vkontakte/android/attachments/AudioAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_4

    .line 349
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 350
    :cond_4
    instance-of v0, v6, Lcom/vkontakte/android/attachments/PollAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_5

    .line 351
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 352
    :cond_5
    instance-of v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_6

    .line 353
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 354
    :cond_6
    instance-of v0, v6, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_7

    .line 355
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 357
    :cond_7
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 360
    .end local v6    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_8
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/AlbumAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_b

    .line 361
    add-int v12, v15, v7

    .line 375
    :goto_1
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_9

    .line 376
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    sub-int v12, v20, v11

    .line 379
    .end local v7    # "albums":I
    .end local v8    # "audios":I
    .end local v10    # "docs":I
    .end local v11    # "fwds":I
    .end local v14    # "others":I
    .end local v15    # "photos":I
    .end local v16    # "polls":I
    .end local v19    # "videos":I
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v12, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 380
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_12

    move-object/from16 v20, p1

    .line 381
    check-cast v20, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createPhotoView(Lcom/vkontakte/android/attachments/PhotoAttachment;)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 441
    .end local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_a
    :goto_2
    return-void

    .line 362
    .restart local v7    # "albums":I
    .restart local v8    # "audios":I
    .restart local v10    # "docs":I
    .restart local v11    # "fwds":I
    .restart local v14    # "others":I
    .restart local v15    # "photos":I
    .restart local v16    # "polls":I
    .restart local v19    # "videos":I
    .restart local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_b
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move/from16 v20, v0

    if-nez v20, :cond_c

    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_d

    .line 363
    :cond_c
    move v12, v15

    goto :goto_1

    .line 364
    :cond_d
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_e

    .line 365
    add-int v20, v15, v7

    add-int v12, v20, v19

    goto :goto_1

    .line 366
    :cond_e
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/AudioAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_f

    .line 367
    add-int v20, v15, v7

    add-int v20, v20, v19

    add-int v12, v20, v8

    goto :goto_1

    .line 368
    :cond_f
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_10

    .line 369
    add-int v20, v15, v7

    add-int v20, v20, v19

    add-int v20, v20, v8

    add-int v12, v20, v16

    goto :goto_1

    .line 370
    :cond_10
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_11

    .line 371
    add-int v20, v15, v7

    add-int v20, v20, v19

    add-int v20, v20, v8

    add-int v20, v20, v16

    add-int v12, v20, v10

    goto/16 :goto_1

    .line 373
    :cond_11
    add-int v20, v15, v7

    add-int v20, v20, v19

    add-int v20, v20, v8

    add-int v20, v20, v16

    add-int v20, v20, v10

    add-int v12, v20, v14

    goto/16 :goto_1

    .line 382
    .end local v7    # "albums":I
    .end local v8    # "audios":I
    .end local v10    # "docs":I
    .end local v11    # "fwds":I
    .end local v14    # "others":I
    .end local v15    # "photos":I
    .end local v16    # "polls":I
    .end local v19    # "videos":I
    :cond_12
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_13

    move-object/from16 v20, p1

    .line 383
    check-cast v20, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createPhotoView(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 384
    check-cast p1, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    .end local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-direct/range {p0 .. p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadAttachment(Lcom/vkontakte/android/attachments/PendingAttachment;)V

    goto/16 :goto_2

    .line 385
    .restart local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_13
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/AudioAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_15

    move-object/from16 v6, p1

    .line 386
    check-cast v6, Lcom/vkontakte/android/attachments/AudioAttachment;

    .line 387
    .local v6, "a":Lcom/vkontakte/android/attachments/AudioAttachment;
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_14

    .line 388
    const v20, 0x7f020166

    iget-object v0, v6, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    move-object/from16 v21, v0

    iget-object v0, v6, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createImagelessView(ILjava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 389
    check-cast p1, Lcom/vkontakte/android/attachments/PendingAudioAttachment;

    .end local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-direct/range {p0 .. p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadAttachment(Lcom/vkontakte/android/attachments/PendingAttachment;)V

    goto/16 :goto_2

    .line 391
    .restart local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_14
    const v20, 0x7f020166

    iget-object v0, v6, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    move-object/from16 v21, v0

    iget-object v0, v6, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createImagelessView(ILjava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 393
    .end local v6    # "a":Lcom/vkontakte/android/attachments/AudioAttachment;
    :cond_15
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_16

    move-object/from16 v20, p1

    .line 394
    check-cast v20, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createVideoView(Lcom/vkontakte/android/attachments/VideoAttachment;)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 395
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_a

    .line 396
    check-cast p1, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    .end local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-direct/range {p0 .. p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadAttachment(Lcom/vkontakte/android/attachments/PendingAttachment;)V

    goto/16 :goto_2

    .line 398
    .restart local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_16
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/MarketAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_17

    move-object/from16 v20, p1

    .line 399
    check-cast v20, Lcom/vkontakte/android/attachments/MarketAttachment;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createMarketView(Lcom/vkontakte/android/attachments/MarketAttachment;)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 400
    :cond_17
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_1b

    move-object/from16 v6, p1

    .line 401
    check-cast v6, Lcom/vkontakte/android/attachments/DocumentAttachment;

    .line 402
    .local v6, "a":Lcom/vkontakte/android/attachments/DocumentAttachment;
    iget-object v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string/jumbo v21, "\\."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    .line 403
    .local v18, "sp":[Ljava/lang/String;
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_18

    move-object/from16 v20, p1

    .line 404
    check-cast v20, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadAttachment(Lcom/vkontakte/android/attachments/PendingAttachment;)V

    .line 406
    :cond_18
    iget-object v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    move-object/from16 v20, v0

    if-eqz v20, :cond_1a

    iget-object v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v20

    if-lez v20, :cond_1a

    .line 407
    instance-of v0, v6, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_19

    .line 408
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    aget-object v21, v18, v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    iget v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v22, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    move-wide/from16 v0, v22

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v6, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createPendingDocumentView(Lcom/vkontakte/android/attachments/DocumentAttachment;Ljava/lang/String;)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 410
    :cond_19
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    aget-object v21, v18, v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    iget v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v22, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    move-wide/from16 v0, v22

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v6, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createDocumentView(Lcom/vkontakte/android/attachments/DocumentAttachment;Ljava/lang/String;)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 413
    :cond_1a
    const v20, 0x7f02016a

    iget-object v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    move-object/from16 v21, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget-object v23, v18, v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ", "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    iget v0, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v24, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createImagelessView(ILjava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 415
    .end local v6    # "a":Lcom/vkontakte/android/attachments/DocumentAttachment;
    .end local v18    # "sp":[Ljava/lang/String;
    :cond_1b
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_1c

    move-object/from16 v20, p1

    .line 416
    check-cast v20, Lcom/vkontakte/android/attachments/GeoAttachment;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createLocationView(Lcom/vkontakte/android/attachments/GeoAttachment;)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 417
    :cond_1c
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_1d

    move-object/from16 v20, p1

    .line 418
    check-cast v20, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;->msgs:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createFwdView(I)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 419
    :cond_1d
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PostAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_1e

    move-object/from16 v20, p1

    .line 420
    check-cast v20, Lcom/vkontakte/android/attachments/PostAttachment;

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v17, v0

    .line 421
    .local v17, "post":Lcom/vkontakte/android/NewsEntry;
    const v20, 0x7f020171

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v21

    const-string/jumbo v22, ""

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createImagelessView(ILjava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 422
    .end local v17    # "post":Lcom/vkontakte/android/NewsEntry;
    :cond_1e
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/LinkAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_1f

    move-object/from16 v13, p1

    .line 423
    check-cast v13, Lcom/vkontakte/android/attachments/LinkAttachment;

    .line 424
    .local v13, "la":Lcom/vkontakte/android/attachments/LinkAttachment;
    const v20, 0x7f02016b

    iget-object v0, v13, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string/jumbo v22, "http://"

    const-string/jumbo v23, ""

    invoke-virtual/range {v21 .. v23}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v21

    const-string/jumbo v22, "https://"

    const-string/jumbo v23, ""

    invoke-virtual/range {v21 .. v23}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v21

    iget-object v0, v13, Lcom/vkontakte/android/attachments/LinkAttachment;->title:Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createImagelessView(ILjava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 425
    .end local v13    # "la":Lcom/vkontakte/android/attachments/LinkAttachment;
    :cond_1f
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_20

    move-object/from16 v13, p1

    .line 426
    check-cast v13, Lcom/vkontakte/android/attachments/PollAttachment;

    .line 427
    .local v13, "la":Lcom/vkontakte/android/attachments/PollAttachment;
    const v20, 0x7f020170

    iget-object v0, v13, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string/jumbo v22, ""

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    move/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->createImagelessView(ILjava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    move-result-object v9

    .line 428
    .local v9, "av":Landroid/view/View;
    new-instance v20, Lcom/vkontakte/android/ui/AttachmentsEditorView$5;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lcom/vkontakte/android/ui/AttachmentsEditorView$5;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;Lcom/vkontakte/android/attachments/PollAttachment;)V

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 437
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v9, v1, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V

    goto/16 :goto_2

    .line 439
    .end local v9    # "av":Landroid/view/View;
    .end local v13    # "la":Lcom/vkontakte/android/attachments/PollAttachment;
    :cond_20
    const-string/jumbo v20, "vk"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v22, "Unknown attachment: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public addHidden(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 2
    .param p1, "att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 322
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "Attach editor add hidden"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 324
    return-void
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 475
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 476
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 477
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->callback:Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    if-eqz v0, :cond_0

    .line 478
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->callback:Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;->onAttachmentRemoved(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 480
    :cond_0
    return-void
.end method

.method public contains(Lcom/vkontakte/android/attachments/Attachment;)Z
    .locals 1
    .param p1, "a"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 444
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsGeoAttachment()Z
    .locals 3

    .prologue
    .line 518
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 519
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v2, :cond_0

    .line 520
    const/4 v1, 0x1

    .line 523
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    .line 715
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->lastTouchX:F

    .line 716
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->lastTouchY:F

    .line 717
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 718
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 719
    invoke-direct {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->updateDragPosition()V

    .line 727
    :cond_0
    :goto_0
    return v0

    .line 720
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eq v1, v0, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 721
    :cond_2
    invoke-direct {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->resetTransitionAnims()V

    .line 722
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 723
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->dragView:Landroid/view/View;

    goto :goto_0

    .line 727
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public getAll()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 492
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 493
    .local v0, "att":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 494
    return-object v0
.end method

.method public getCount()I
    .locals 4

    .prologue
    .line 461
    const/4 v1, 0x0

    .line 462
    .local v1, "size":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 463
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-nez v3, :cond_0

    instance-of v3, v0, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    if-nez v3, :cond_0

    .line 464
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 467
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    return v1
.end method

.method public getRealCount()I
    .locals 1

    .prologue
    .line 471
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public isUploading()Z
    .locals 3

    .prologue
    .line 483
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 484
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v2, :cond_0

    .line 485
    const/4 v1, 0x1

    .line 488
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->remove(Lcom/vkontakte/android/attachments/Attachment;)V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v7, 0x7f1001eb

    const/4 v6, 0x0

    .line 78
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 79
    .local v1, "aview":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 80
    .local v2, "t":Ljava/lang/Object;
    instance-of v3, v2, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v3, :cond_0

    .line 81
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "RETRY CLICK "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, v6}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 83
    const v3, 0x7f1001ec

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-static {v3, v4}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 84
    instance-of v3, v2, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    if-eqz v3, :cond_1

    .line 85
    check-cast v2, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    .end local v2    # "t":Ljava/lang/Object;
    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->retryUploadVideo(Lcom/vkontakte/android/attachments/PendingVideoAttachment;)V

    .line 93
    :cond_0
    :goto_0
    return-void

    .line 87
    .restart local v2    # "t":Ljava/lang/Object;
    :cond_1
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    invoke-virtual {v3, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    move-object v0, v2

    .line 88
    check-cast v0, Lcom/vkontakte/android/attachments/PendingAttachment;

    .line 89
    .local v0, "attachment":Lcom/vkontakte/android/attachments/PendingAttachment;
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v3

    invoke-interface {v0, v3}, Lcom/vkontakte/android/attachments/PendingAttachment;->setId(I)V

    .line 90
    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadAttachment(Lcom/vkontakte/android/attachments/PendingAttachment;)V

    goto :goto_0
.end method

.method synthetic lambda$retryUploadVideo$3(Lcom/vkontakte/android/attachments/PendingVideoAttachment;)V
    .locals 2
    .param p1, "att"    # Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    .prologue
    .line 711
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->getId()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/upload/Upload;->retry(Landroid/content/Context;I)V

    return-void
.end method

.method public onAttachedToWindow()V
    .locals 5

    .prologue
    .line 300
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 301
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 302
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_PROGRESS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 303
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 304
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 305
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_FAILED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 306
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 307
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 310
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 312
    :try_start_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    :goto_0
    return-void

    .line 313
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public remove(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 498
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 499
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    .line 500
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->callback:Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    if-eqz v1, :cond_0

    .line 501
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->callback:Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;->onAttachmentRemoved(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 503
    :cond_0
    instance-of v1, v0, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v1, :cond_1

    .line 504
    check-cast v0, Lcom/vkontakte/android/attachments/PendingAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v0}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/upload/Upload;->cancel(I)V

    .line 506
    :cond_1
    return-void
.end method

.method public remove(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 3
    .param p1, "a"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 448
    const/4 v1, -0x1

    .line 449
    .local v1, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 450
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_2

    .line 451
    move v1, v0

    .line 455
    :cond_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 456
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->remove(I)V

    .line 458
    :cond_1
    return-void

    .line 449
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public removeWithoutCallback(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 510
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    .line 511
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 515
    :goto_0
    return-void

    .line 512
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setCallback(Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;)V
    .locals 0
    .param p1, "c"    # Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->callback:Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    .line 319
    return-void
.end method
