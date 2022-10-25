.class public Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "PhotoListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;,
        Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;,
        Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;,
        Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;,
        Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;,
        Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;",
        "Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;"
    }
.end annotation


# static fields
.field private static final ROW_HEIGHT:I = 0xb4

.field private static final UPLOAD_RESULT:I = 0xf32


# instance fields
.field protected adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field protected album:Lcom/vkontakte/android/api/PhotoAlbum;

.field protected layout:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private listWidth:I

.field private receiver:Landroid/content/BroadcastReceiver;

.field protected showAlbumHeader:Z

.field protected viewer:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 167
    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    .line 106
    new-instance v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 168
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "perPage"    # I

    .prologue
    .line 171
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    .line 106
    new-instance v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 172
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layoutPhotos()V

    return-void
.end method

.method static synthetic access$1002(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
    .param p1, "x1"    # I

    .prologue
    .line 81
    iput p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->listWidth:I

    return p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method private layoutPhotos()V
    .locals 22

    .prologue
    .line 466
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-eqz v17, :cond_0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->listWidth:I

    move/from16 v17, v0

    if-nez v17, :cond_1

    .line 538
    :cond_0
    :goto_0
    return-void

    .line 469
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->clear()V

    .line 470
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->listWidth:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v18

    move-object/from16 v0, v18

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    move/from16 v18, v0

    div-float v17, v17, v18

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v14

    .line 471
    .local v14, "scrW":I
    int-to-float v0, v14

    move/from16 v17, v0

    const/high16 v18, 0x3fc00000    # 1.5f

    mul-float v17, v17, v18

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 472
    .local v9, "maxW":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 473
    .local v11, "row":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;>;"
    const/4 v12, 0x0

    .line 474
    .local v12, "rowW":I
    const/4 v7, 0x0

    .line 475
    .local v7, "j":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_9

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/Photo;

    .line 476
    .local v10, "photo":Lcom/vkontakte/android/Photo;
    const/16 v18, 0x78

    move/from16 v0, v18

    invoke-virtual {v10, v0}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v6

    .line 477
    .local v6, "img":Lcom/vkontakte/android/Photo$Image;
    iget v0, v6, Lcom/vkontakte/android/Photo$Image;->width:I

    move/from16 v18, v0

    if-nez v18, :cond_4

    const/16 v13, 0xb4

    .line 478
    .local v13, "scaledW":I
    :goto_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->needLineBreakAfter(I)Z

    move-result v4

    .line 479
    .local v4, "forceBreak":Z
    add-int v18, v12, v13

    move/from16 v0, v18

    if-gt v0, v9, :cond_2

    if-eqz v4, :cond_7

    .line 480
    :cond_2
    int-to-float v0, v14

    move/from16 v18, v0

    int-to-float v0, v12

    move/from16 v19, v0

    div-float v3, v18, v19

    .line 481
    .local v3, "f":F
    const/16 v15, 0x3e8

    .line 482
    .local v15, "spansLeft":I
    invoke-static {v12, v14}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 483
    .local v16, "widthLeft":I
    const/4 v5, 0x0

    .line 484
    .local v5, "i":I
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    .line 485
    .local v8, "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    const/high16 v19, 0x43340000    # 180.0f

    invoke-static/range {v19 .. v19}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const v20, 0x3f8ccccd    # 1.1f

    move/from16 v0, v20

    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    move-result v20

    mul-float v19, v19, v20

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->round(F)I

    move-result v19

    move/from16 v0, v19

    iput v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->height:I

    .line 486
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->scaledWidth:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v19, v19, v20

    int-to-float v0, v15

    move/from16 v20, v0

    mul-float v19, v19, v20

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->round(F)I

    move-result v19

    move/from16 v0, v19

    iput v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    .line 487
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    move/from16 v19, v0

    sub-int v15, v15, v19

    .line 488
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->scaledWidth:I

    move/from16 v19, v0

    sub-int v16, v16, v19

    .line 489
    if-eqz v4, :cond_3

    .line 490
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v19

    if-ne v5, v0, :cond_3

    const/16 v19, 0x64

    move/from16 v0, v19

    if-ge v15, v0, :cond_3

    .line 492
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    move/from16 v19, v0

    add-int v19, v19, v15

    move/from16 v0, v19

    iput v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    .line 495
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 496
    goto :goto_3

    .line 477
    .end local v3    # "f":F
    .end local v4    # "forceBreak":Z
    .end local v5    # "i":I
    .end local v8    # "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    .end local v13    # "scaledW":I
    .end local v15    # "spansLeft":I
    .end local v16    # "widthLeft":I
    :cond_4
    const/high16 v18, 0x3fc00000    # 1.5f

    const/high16 v19, 0x3f000000    # 0.5f

    iget v0, v6, Lcom/vkontakte/android/Photo$Image;->width:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    iget v0, v6, Lcom/vkontakte/android/Photo$Image;->height:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v20, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->max(FF)F

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(FF)F

    move-result v18

    const/high16 v19, 0x43340000    # 180.0f

    mul-float v18, v18, v19

    invoke-static/range {v18 .. v18}, Ljava/lang/Math;->round(F)I

    move-result v13

    goto/16 :goto_2

    .line 497
    .restart local v3    # "f":F
    .restart local v4    # "forceBreak":Z
    .restart local v5    # "i":I
    .restart local v13    # "scaledW":I
    .restart local v15    # "spansLeft":I
    .restart local v16    # "widthLeft":I
    :cond_5
    if-nez v4, :cond_6

    if-lez v15, :cond_6

    .line 498
    const/4 v5, 0x0

    .line 499
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_4
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    .line 500
    .restart local v8    # "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v19

    sub-int v19, v19, v5

    div-int v2, v15, v19

    .line 501
    .local v2, "add":I
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    move/from16 v19, v0

    add-int v19, v19, v2

    move/from16 v0, v19

    iput v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    .line 502
    sub-int/2addr v15, v2

    .line 503
    add-int/lit8 v5, v5, 0x1

    .line 504
    goto :goto_4

    .line 506
    .end local v2    # "add":I
    .end local v8    # "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 507
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 508
    const/4 v12, 0x0

    .line 510
    .end local v3    # "f":F
    .end local v5    # "i":I
    .end local v15    # "spansLeft":I
    .end local v16    # "widthLeft":I
    :cond_7
    add-int v18, v12, v13

    move/from16 v0, v18

    if-gt v0, v9, :cond_8

    .line 511
    new-instance v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v8, v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;)V

    .line 512
    .restart local v8    # "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    iput-object v10, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->photo:Lcom/vkontakte/android/Photo;

    .line 513
    iput v13, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->scaledWidth:I

    .line 514
    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 515
    add-int/2addr v12, v13

    .line 517
    .end local v8    # "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    :cond_8
    add-int/lit8 v7, v7, 0x1

    .line 518
    goto/16 :goto_1

    .line 519
    .end local v4    # "forceBreak":Z
    .end local v6    # "img":Lcom/vkontakte/android/Photo$Image;
    .end local v10    # "photo":Lcom/vkontakte/android/Photo;
    .end local v13    # "scaledW":I
    :cond_9
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_0

    .line 520
    const/high16 v17, 0x3f800000    # 1.0f

    int-to-float v0, v14

    move/from16 v18, v0

    int-to-float v0, v12

    move/from16 v19, v0

    div-float v18, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 521
    .restart local v3    # "f":F
    const/16 v15, 0x3e8

    .line 522
    .restart local v15    # "spansLeft":I
    invoke-static {v12, v14}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 523
    .restart local v16    # "widthLeft":I
    const/4 v5, 0x0

    .line 524
    .restart local v5    # "i":I
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_5
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_b

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    .line 525
    .restart local v8    # "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    const/high16 v18, 0x43340000    # 180.0f

    invoke-static/range {v18 .. v18}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v18

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    mul-float v18, v18, v3

    invoke-static/range {v18 .. v18}, Ljava/lang/Math;->round(F)I

    move-result v18

    move/from16 v0, v18

    iput v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->height:I

    .line 526
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->scaledWidth:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v19, v0

    div-float v18, v18, v19

    int-to-float v0, v15

    move/from16 v19, v0

    mul-float v18, v18, v19

    invoke-static/range {v18 .. v18}, Ljava/lang/Math;->round(F)I

    move-result v18

    move/from16 v0, v18

    iput v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    .line 527
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    move/from16 v18, v0

    sub-int v15, v15, v18

    .line 528
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->scaledWidth:I

    move/from16 v18, v0

    sub-int v16, v16, v18

    .line 529
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v18

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    if-ne v5, v0, :cond_a

    const/16 v18, 0xa

    move/from16 v0, v18

    if-ge v15, v0, :cond_a

    .line 531
    iget v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    move/from16 v18, v0

    add-int v18, v18, v15

    move/from16 v0, v18

    iput v0, v8, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    .line 533
    :cond_a
    add-int/lit8 v5, v5, 0x1

    .line 534
    goto :goto_5

    .line 535
    .end local v8    # "li":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 536
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    goto/16 :goto_0
.end method


# virtual methods
.method public disableRefresh()V
    .locals 1

    .prologue
    .line 462
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setRefreshEnabled(Z)V

    .line 463
    return-void
.end method

.method protected doLoadData(II)V
    .locals 6
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v5, 0x1

    const/16 v1, -0x2328

    .line 341
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-nez v0, :cond_1

    .line 342
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "album"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 344
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 386
    :cond_0
    :goto_0
    return-void

    .line 348
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-le v0, v1, :cond_2

    .line 349
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGet;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    move v3, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/photos/PhotosGet;-><init>(IIIIZ)V

    new-instance v1, Lcom/vkontakte/android/api/SimpleListCallback;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 350
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 351
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0

    .line 353
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-ne v0, v1, :cond_3

    .line 354
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->dataLoading:Z

    .line 355
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotos;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    invoke-direct {v0, v1, p1, p2}, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotos;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$6;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$6;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 356
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotos;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 363
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0

    .line 364
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    const/16 v1, -0x2329

    if-ne v0, v1, :cond_4

    .line 365
    new-instance v0, Lcom/vkontakte/android/api/fave/FaveGetPhotos;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/fave/FaveGetPhotos;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$7;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$7;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 366
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/fave/FaveGetPhotos;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 373
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0

    .line 374
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    const/16 v1, -0x232a

    if-ne v0, v1, :cond_0

    .line 375
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGetAll;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    invoke-direct {v0, v1, p1, p2}, Lcom/vkontakte/android/api/photos/PhotosGetAll;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$8;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$8;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 376
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGetAll;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 383
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto/16 :goto_0
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 4

    .prologue
    .line 442
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v0, :cond_1

    .line 443
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 444
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->showAlbumHeader:Z

    if-eqz v0, :cond_0

    .line 445
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 447
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    const/4 v2, 0x0

    const v3, 0x7fffffff

    invoke-direct {v1, p0, v2, v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;II)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 449
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    return-object v0
.end method

.method protected getItemOffsets(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;IILandroid/graphics/Rect;)V
    .locals 4
    .param p1, "adapter"    # Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .param p2, "positionInAdapter"    # I
    .param p3, "absPosition"    # I
    .param p4, "outRect"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v3, 0x40400000    # 3.0f

    .line 545
    instance-of v1, p1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    if-nez v1, :cond_1

    .line 561
    .end local p1    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    :cond_0
    :goto_0
    return-void

    .line 548
    .restart local p1    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    :cond_1
    move v0, p2

    .line 549
    .local v0, "pos":I
    check-cast p1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    .end local p1    # "adapter":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    invoke-static {p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->access$1900(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;)I

    move-result v1

    add-int/2addr v0, v1

    .line 550
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 553
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, p4, Landroid/graphics/Rect;->right:I

    .line 554
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Photo;

    iget v1, v1, Lcom/vkontakte/android/Photo;->id:I

    const/high16 v2, -0x80000000

    if-ne v1, v2, :cond_2

    .line 555
    if-lez v0, :cond_0

    .line 556
    const/high16 v1, -0x3fc00000    # -3.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, p4, Landroid/graphics/Rect;->top:I

    goto :goto_0

    .line 560
    :cond_2
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, p4, Landroid/graphics/Rect;->bottom:I

    goto :goto_0
.end method

.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 11
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x0

    .line 580
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 581
    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 582
    .local v5, "v":Landroid/view/View;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    .line 583
    .local v0, "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    instance-of v6, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;

    if-eqz v6, :cond_2

    .line 584
    check-cast v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;

    .end local v0    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    .line 585
    .local v4, "photo":Lcom/vkontakte/android/Photo;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-ne v6, p1, :cond_2

    .line 586
    const/4 v6, 0x2

    new-array v2, v6, [I

    fill-array-data v2, :array_0

    .line 587
    .local v2, "loc":[I
    invoke-virtual {v5, v2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 588
    aget v6, v2, v8

    aget v7, v2, v10

    aget v8, v2, v8

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v9

    add-int/2addr v8, v9

    aget v9, v2, v10

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {p2, v6, v7, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 589
    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v5, v6}, Lme/grishka/appkit/utils/V;->getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v3

    .line 590
    .local v3, "offset":Landroid/graphics/Point;
    iget v6, v3, Landroid/graphics/Point;->y:I

    if-gez v6, :cond_0

    .line 591
    iget v6, v3, Landroid/graphics/Point;->y:I

    neg-int v6, v6

    iput v6, p3, Landroid/graphics/Rect;->top:I

    .line 593
    :cond_0
    iget v6, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v7

    if-le v6, v7, :cond_1

    .line 594
    iget v6, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v7

    sub-int/2addr v6, v7

    iput v6, p3, Landroid/graphics/Rect;->bottom:I

    .line 600
    .end local v2    # "loc":[I
    .end local v3    # "offset":Landroid/graphics/Point;
    .end local v4    # "photo":Lcom/vkontakte/android/Photo;
    .end local v5    # "v":Landroid/view/View;
    :cond_1
    return-void

    .line 580
    .restart local v5    # "v":Landroid/view/View;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 586
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public isMoreAvailable()Z
    .locals 1

    .prologue
    .line 623
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->isMoreAvailable()Z

    move-result v0

    return v0
.end method

.method public loadMore()V
    .locals 0

    .prologue
    .line 628
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->onScrolledToLastItem()V

    .line 629
    return-void
.end method

.method protected needLineBreakAfter(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 541
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 14
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 603
    const/16 v1, 0xf32

    if-ne p1, v1, :cond_2

    const/4 v1, -0x1

    move/from16 v0, p2

    if-ne v0, v1, :cond_2

    .line 605
    const-string/jumbo v1, "files"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 606
    const-string/jumbo v1, "files"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v11

    .line 611
    .local v11, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_0
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 612
    .local v13, "tasks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/upload/UploadTask;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 613
    .local v3, "file":Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v4, v4, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v5, v5, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    const-string/jumbo v6, ""

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IILjava/lang/String;Z)V

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 608
    .end local v3    # "file":Ljava/lang/String;
    .end local v11    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v13    # "tasks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/upload/UploadTask;>;"
    :cond_0
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 609
    .restart local v11    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v1, "file"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 615
    .restart local v13    # "tasks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/upload/UploadTask;>;"
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v12

    .line 616
    .local v12, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v2, v12, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 617
    .local v10, "pIntent":Landroid/app/PendingIntent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v4, Lcom/vkontakte/android/upload/BatchUploadTask;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const v2, 0x7f080733

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    const v2, 0x7f0804b3

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    const v2, 0x7f0804b4

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object v6, v13

    invoke-direct/range {v4 .. v10}, Lcom/vkontakte/android/upload/BatchUploadTask;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    invoke-static {v1, v4}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 619
    .end local v10    # "pIntent":Landroid/app/PendingIntent;
    .end local v11    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "intent":Landroid/content/Intent;
    .end local v13    # "tasks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/upload/UploadTask;>;"
    :cond_2
    return-void
.end method

.method public onAppendItems(Ljava/util/List;)V
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
    .line 454
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAppendItems(Ljava/util/List;)V

    .line 455
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    if-eqz v0, :cond_0

    .line 456
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/PhotoViewer;->appendPhotos(Ljava/util/List;)V

    .line 458
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layoutPhotos()V

    .line 459
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x1

    .line 176
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 177
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "album"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    .line 178
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "no_album_header"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->showAlbumHeader:Z

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 180
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "__is_tab"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 181
    const v0, 0x7f0b010f

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 182
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setHasOptionsMenu(Z)V

    .line 184
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->loaded:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "__is_tab"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "autoload"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 185
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->loadData()V

    .line 188
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "album"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 189
    return-void

    .line 178
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "s"    # Landroid/os/Bundle;

    .prologue
    .line 192
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 193
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 194
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.PHOTO_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 195
    const-string/jumbo v1, "com.vkontakte.android.PHOTO_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 196
    const-string/jumbo v1, "com.vkontakte.android.UPDATE_PHOTO"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 197
    const-string/jumbo v1, "com.vkontakte.android.UPDATE_ALBUM_COVER"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 198
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 199
    return-void
.end method

.method protected onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .locals 3

    .prologue
    .line 321
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/16 v2, 0x3e8

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 322
    .local v0, "glm":Landroid/support/v7/widget/GridLayoutManager;
    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 336
    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 10
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 396
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "__is_tab"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 417
    :cond_0
    return-void

    .line 399
    :cond_1
    const v6, 0x7f11000a

    invoke-virtual {p2, v6, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 400
    const v6, 0x7f1000b0

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    new-instance v7, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f02015f

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    const v9, -0x878686

    invoke-direct {v7, v8, v9}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 401
    const v6, 0x7f1000b0

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v6, v6, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-lez v6, :cond_4

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-boolean v6, v6, Lcom/vkontakte/android/api/PhotoAlbum;->canUpload:Z

    if-nez v6, :cond_2

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v6, v6, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    invoke-static {v6}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v6

    if-eqz v6, :cond_4

    :cond_2
    const/4 v6, 0x1

    :goto_0
    invoke-interface {v7, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 402
    const v6, 0x7f10000f

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v6, v6, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    const/16 v8, -0x2328

    if-le v6, v8, :cond_5

    const/4 v6, 0x1

    :goto_1
    invoke-interface {v7, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 403
    const v6, 0x7f1000b0

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 404
    .local v0, "add":Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 405
    invoke-interface {v0}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v4

    .line 406
    .local v4, "subMenu":Landroid/view/SubMenu;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0f0018

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/ViewUtils;->colorizeSubmenu(Landroid/view/SubMenu;I)V

    .line 407
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-interface {v4}, Landroid/view/SubMenu;->size()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 408
    invoke-interface {v4, v1}, Landroid/view/SubMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 409
    .local v2, "item":Landroid/view/MenuItem;
    if-eqz v2, :cond_3

    .line 410
    invoke-interface {v2}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    .line 411
    .local v5, "title":Ljava/lang/CharSequence;
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 412
    .local v3, "ss":Landroid/text/SpannableString;
    new-instance v6, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0f0018

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-direct {v6, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/4 v7, 0x0

    invoke-virtual {v3}, Landroid/text/SpannableString;->length()I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual {v3, v6, v7, v8, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 413
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 407
    .end local v3    # "ss":Landroid/text/SpannableString;
    .end local v5    # "title":Ljava/lang/CharSequence;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 401
    .end local v0    # "add":Landroid/view/MenuItem;
    .end local v1    # "i":I
    .end local v2    # "item":Landroid/view/MenuItem;
    .end local v4    # "subMenu":Landroid/view/SubMenu;
    :cond_4
    const/4 v6, 0x0

    goto :goto_0

    .line 402
    :cond_5
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public onDataLoaded(Lme/grishka/appkit/api/PaginatedList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lme/grishka/appkit/api/PaginatedList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 390
    .local p1, "d":Lme/grishka/appkit/api/PaginatedList;, "Lme/grishka/appkit/api/PaginatedList<Lcom/vkontakte/android/Photo;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDataLoaded(Lme/grishka/appkit/api/PaginatedList;)V

    .line 391
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-virtual {p1}, Lme/grishka/appkit/api/PaginatedList;->total()I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    .line 392
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 202
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 203
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 204
    return-void
.end method

.method public onDismissed()V
    .locals 1

    .prologue
    .line 633
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    .line 634
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/16 v6, 0xf32

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 421
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f10000f

    if-ne v4, v5, :cond_0

    .line 422
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string/jumbo v5, "clipboard"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 423
    .local v1, "mgr":Landroid/content/ClipboardManager;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "https://vk.com/album"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v5, v5, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v5, v5, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 424
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f080339

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 437
    .end local v1    # "mgr":Landroid/content/ClipboardManager;
    :goto_0
    return v2

    .line 427
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005ef

    if-ne v4, v5, :cond_1

    .line 428
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 429
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "type"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 430
    invoke-virtual {p0, v0, v6}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 432
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const v5, 0x7f1005ee

    if-ne v4, v5, :cond_2

    .line 433
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 434
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "type"

    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 435
    invoke-virtual {p0, v0, v6}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2
    move v2, v3

    .line 437
    goto :goto_0
.end method

.method protected onPhotoRemoved()V
    .locals 0

    .prologue
    .line 638
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 208
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "__is_tab"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 210
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const v5, -0x8e8a86

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 213
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setDrawSelectorOnTop(Z)V

    .line 214
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/high16 v3, -0x3fc00000    # -3.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v2, v6, v6, v3, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 215
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v3, 0x7f02013e

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(I)V

    .line 216
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2, v6}, Lme/grishka/appkit/views/UsableRecyclerView;->setScrollBarStyle(I)V

    .line 217
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$2;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 225
    new-instance v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$3;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$3;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    invoke-virtual {p1, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 237
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "__is_tab"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 238
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 239
    .local v0, "activity":Landroid/app/Activity;
    instance-of v2, v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;

    if-eqz v2, :cond_1

    move-object v2, v0

    check-cast v2, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;

    .line 240
    invoke-interface {v2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v2

    instance-of v2, v2, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    if-eqz v2, :cond_1

    .line 241
    check-cast v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;

    .line 242
    .end local v0    # "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    .line 243
    .local v1, "ndlm":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->setStatusBarColor(I)V

    .line 245
    .end local v1    # "ndlm":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_2

    .line 246
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const v3, 0x45bbbbbb

    invoke-virtual {v2, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 247
    const/16 v2, 0x2000

    invoke-virtual {p1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 249
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "no_album_header"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 250
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 317
    :cond_3
    return-void
.end method

.method protected openPhoto(Lcom/vkontakte/android/Photo;)V
    .locals 5
    .param p1, "photo"    # Lcom/vkontakte/android/Photo;

    .prologue
    .line 564
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "select"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 565
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 566
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 567
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 568
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 576
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 571
    :cond_0
    new-instance v1, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4, p0}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    .line 572
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/PhotoViewer;->setTitle(Ljava/lang/String;)V

    .line 573
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/PhotoViewer;->setDisplayTotal(I)V

    .line 574
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/PhotoViewer;->setAlbumIDs(II)V

    .line 575
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v1}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto :goto_0
.end method
