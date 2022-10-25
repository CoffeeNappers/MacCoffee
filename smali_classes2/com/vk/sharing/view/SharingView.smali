.class public final Lcom/vk/sharing/view/SharingView;
.super Landroid/widget/ScrollView;
.source "SharingView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/view/SharingView$TargetViewHolder;,
        Lcom/vk/sharing/view/SharingView$TargetsAdapter;,
        Lcom/vk/sharing/view/SharingView$Presenter;
    }
.end annotation


# static fields
.field private static final CONTENT_CHILD_EMPTY:I = 0x2

.field private static final CONTENT_CHILD_ERROR:I = 0x3

.field private static final CONTENT_CHILD_LIST:I = 0x0

.field private static final CONTENT_CHILD_PROGRESS:I = 0x1

.field private static final FOOTER_CHILD_ACTIONS:I = 0x0

.field private static final FOOTER_CHILD_CANCEL:I = 0x2

.field private static final FOOTER_CHILD_SEND:I = 0x1

.field private static final FOOTER_MARGIN_START_ATTACHMENT:I

.field private static final FOOTER_MARGIN_TOP_ATTACHMENT:I

.field private static final FOOTER_MARGIN_TOP_CONTENT:I

.field private static final FOOTER_MARGIN_TOP_NO_CONTENT:I

.field private static final HEADER_CHILD_COMMON:I = 0x0

.field private static final HEADER_CHILD_SEARCH:I = 0x1

.field private static final HEADER_MARGIN_END_SEARCH_INPUT:I

.field private static final HEADER_MARGIN_END_SEARCH_INPUT_EMPTY:I

.field private static final HEADER_MARGIN_START_BACK_BUTTON:I

.field private static final HEADER_MARGIN_START_COMMON:I


# instance fields
.field private final actionsView:Lcom/vk/sharing/view/SharingActionsView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final adapter:Lcom/vk/sharing/view/SharingView$TargetsAdapter;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field animating:Z

.field private attachmentView:Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final backButton:Landroid/view/View;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final backClickListener:Landroid/view/View$OnClickListener;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final bottomSheet:Landroid/view/View;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private cancelButton:Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private commentInputView:Landroid/widget/EditText;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final contentAnimator:Landroid/widget/ViewAnimator;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final contentContainer:Landroid/view/View;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private emptyView:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private errorView:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final footerAnimator:Landroid/widget/ViewAnimator;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final headerAnimator:Landroid/widget/ViewAnimator;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final list:Landroid/support/v7/widget/RecyclerView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private predefinedComment:Ljava/lang/String;

.field presenter:Lcom/vk/sharing/view/SharingView$Presenter;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final searchButton:Landroid/view/View;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private searchClearButton:Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private searchInputView:Landroid/widget/EditText;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final searchInputWatcher:Landroid/text/TextWatcher;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private sendButton:Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private sendButtonCounter:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final sendClickListener:Landroid/view/View$OnClickListener;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final sendContainer:Landroid/widget/LinearLayout;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final subTitleView:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private targets:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation
.end field

.field private final titleView:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/16 v3, 0x38

    const/16 v2, 0x10

    const/16 v1, 0x8

    .line 48
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_START_COMMON:I

    .line 49
    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_START_BACK_BUTTON:I

    .line 50
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_END_SEARCH_INPUT_EMPTY:I

    .line 51
    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_END_SEARCH_INPUT:I

    .line 52
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_TOP_CONTENT:I

    .line 53
    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_TOP_NO_CONTENT:I

    .line 54
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_START_ATTACHMENT:I

    .line 55
    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_TOP_ATTACHMENT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 226
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/sharing/view/SharingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 227
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 230
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/sharing/view/SharingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 231
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 234
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 194
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->targets:Ljava/util/List;

    .line 223
    iput-object v5, p0, Lcom/vk/sharing/view/SharingView;->predefinedComment:Ljava/lang/String;

    .line 235
    invoke-virtual {p0, v4}, Lcom/vk/sharing/view/SharingView;->setFillViewport(Z)V

    .line 236
    const v2, 0x7f0300e9

    invoke-static {p1, v2, p0}, Lcom/vk/sharing/view/SharingView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 238
    new-instance v2, Lcom/vk/sharing/view/KeyboardListener;

    invoke-direct {v2, p0}, Lcom/vk/sharing/view/KeyboardListener;-><init>(Lcom/vk/sharing/view/SharingView;)V

    .line 240
    const v2, 0x7f100350

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    .line 241
    const/16 v2, 0x200

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    .line 242
    .local v0, "maxBottomSheetWidth":I
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    if-le v2, v0, :cond_0

    .line 243
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 246
    :cond_0
    const v2, 0x7f100351

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->backButton:Landroid/view/View;

    .line 247
    const v2, 0x7f10034c

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->searchButton:Landroid/view/View;

    .line 248
    const v2, 0x7f100352

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ViewAnimator;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->headerAnimator:Landroid/widget/ViewAnimator;

    .line 249
    const v2, 0x7f10034a

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->titleView:Landroid/widget/TextView;

    .line 250
    const v2, 0x7f10034b

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->subTitleView:Landroid/widget/TextView;

    .line 252
    invoke-static {p0}, Lcom/vk/sharing/view/SharingView$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/view/SharingView;)Landroid/view/View$OnClickListener;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->backClickListener:Landroid/view/View$OnClickListener;

    .line 254
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->backButton:Landroid/view/View;

    iget-object v3, p0, Lcom/vk/sharing/view/SharingView;->backClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 255
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->searchButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/sharing/view/SharingView$$Lambda$2;->lambdaFactory$(Lcom/vk/sharing/view/SharingView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 261
    new-instance v2, Lcom/vk/sharing/view/SharingView$1;

    invoke-direct {v2, p0}, Lcom/vk/sharing/view/SharingView$1;-><init>(Lcom/vk/sharing/view/SharingView;)V

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->searchInputWatcher:Landroid/text/TextWatcher;

    .line 276
    const v2, 0x7f10000e

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->contentContainer:Landroid/view/View;

    .line 277
    const v2, 0x7f100354

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ViewAnimator;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->contentAnimator:Landroid/widget/ViewAnimator;

    .line 279
    new-instance v2, Lcom/vk/sharing/view/SharingView$TargetsAdapter;

    invoke-direct {v2, p0, v5}, Lcom/vk/sharing/view/SharingView$TargetsAdapter;-><init>(Lcom/vk/sharing/view/SharingView;Lcom/vk/sharing/view/SharingView$1;)V

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->adapter:Lcom/vk/sharing/view/SharingView$TargetsAdapter;

    .line 281
    const v2, 0x7f100353

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    .line 282
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/vk/sharing/view/SharingView;->adapter:Lcom/vk/sharing/view/SharingView$TargetsAdapter;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 283
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 285
    const v2, 0x7f100355

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0}, Lcom/vk/sharing/view/SharingView$$Lambda$3;->lambdaFactory$(Lcom/vk/sharing/view/SharingView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 291
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/LinearLayoutManager;

    .line 293
    .local v1, "targetsLayoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    new-instance v2, Lcom/vk/sharing/view/SharingView$2;

    invoke-direct {v2, p0, v1}, Lcom/vk/sharing/view/SharingView$2;-><init>(Lcom/vk/sharing/view/SharingView;Landroid/support/v7/widget/LinearLayoutManager;)V

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 304
    const v2, 0x7f10034f

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0}, Lcom/vk/sharing/view/SharingView$$Lambda$4;->lambdaFactory$(Lcom/vk/sharing/view/SharingView;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    const v2, 0x7f100356

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ViewAnimator;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->footerAnimator:Landroid/widget/ViewAnimator;

    .line 312
    const v2, 0x7f100344

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/view/SharingActionsView;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->actionsView:Lcom/vk/sharing/view/SharingActionsView;

    .line 313
    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->actionsView:Lcom/vk/sharing/view/SharingActionsView;

    invoke-static {p0}, Lcom/vk/sharing/view/SharingView$$Lambda$5;->lambdaFactory$(Lcom/vk/sharing/view/SharingView;)Lcom/vk/sharing/view/SharingActionsView$Listener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/sharing/view/SharingActionsView;->setListener(Lcom/vk/sharing/view/SharingActionsView$Listener;)V

    .line 319
    const v2, 0x7f100346

    invoke-virtual {p0, v2}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->sendContainer:Landroid/widget/LinearLayout;

    .line 321
    invoke-static {p0}, Lcom/vk/sharing/view/SharingView$$Lambda$6;->lambdaFactory$(Lcom/vk/sharing/view/SharingView;)Landroid/view/View$OnClickListener;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/sharing/view/SharingView;->sendClickListener:Landroid/view/View$OnClickListener;

    .line 326
    return-void
.end method

.method static synthetic access$100(Lcom/vk/sharing/view/SharingView;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/view/SharingView;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->targets:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/sharing/view/SharingView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/view/SharingView;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vk/sharing/view/SharingView;->animateShow()V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/sharing/view/SharingView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/view/SharingView;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vk/sharing/view/SharingView;->animateHide()V

    return-void
.end method

.method private animateHide()V
    .locals 4

    .prologue
    .line 449
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->isAnimating()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 470
    :goto_0
    return-void

    .line 453
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/sharing/view/SharingView;->animating:Z

    .line 454
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    .line 455
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc3

    .line 456
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lcom/vk/core/util/AnimationUtils;->accelerationCurve:Landroid/support/v4/view/animation/FastOutLinearInInterpolator;

    .line 457
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 458
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/sharing/view/SharingView$6;

    invoke-direct {v1, p0}, Lcom/vk/sharing/view/SharingView$6;-><init>(Lcom/vk/sharing/view/SharingView;)V

    .line 459
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 469
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private animateShow()V
    .locals 4

    .prologue
    .line 408
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->isAnimating()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 431
    :goto_0
    return-void

    .line 412
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/sharing/view/SharingView;->animating:Z

    .line 414
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 415
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 416
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xe1

    .line 417
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lcom/vk/core/util/AnimationUtils;->decelerationCurve:Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;

    .line 418
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/sharing/view/SharingView$4;

    invoke-direct {v1, p0}, Lcom/vk/sharing/view/SharingView$4;-><init>(Lcom/vk/sharing/view/SharingView;)V

    .line 419
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 429
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 430
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private changeFooterAnimatorTopMargin(I)V
    .locals 2
    .param p1, "margin"    # I

    .prologue
    .line 533
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->footerAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1}, Landroid/widget/ViewAnimator;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 534
    .local v0, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 535
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->footerAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1}, Landroid/widget/ViewAnimator;->requestLayout()V

    .line 536
    return-void
.end method

.method private changeHeaderAnimatorStartMargin(I)V
    .locals 2
    .param p1, "margin"    # I

    .prologue
    .line 516
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->headerAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1}, Landroid/widget/ViewAnimator;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 517
    .local v0, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 518
    invoke-static {v0, p1}, Landroid/support/v4/view/MarginLayoutParamsCompat;->setMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 519
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->headerAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1}, Landroid/widget/ViewAnimator;->requestLayout()V

    .line 520
    return-void
.end method

.method private static changeSearchInputEllipsize(Landroid/widget/TextView;Landroid/text/TextUtils$TruncateAt;)V
    .locals 0
    .param p0, "v"    # Landroid/widget/TextView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "truncateAt"    # Landroid/text/TextUtils$TruncateAt;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 746
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 747
    return-void
.end method

.method private static changeSearchInputEndMargin(Landroid/view/View;I)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "margin"    # I

    .prologue
    .line 739
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 740
    .local v0, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 741
    invoke-static {v0, p1}, Landroid/support/v4/view/MarginLayoutParamsCompat;->setMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 742
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 743
    return-void
.end method

.method private showKeyboard(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 671
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    const/4 v1, 0x0

    .line 672
    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 673
    return-void
.end method


# virtual methods
.method public disableSendFooter()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 763
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButton:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 764
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 766
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    .line 767
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 769
    :cond_1
    return-void
.end method

.method public enableSendFooter()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 754
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButton:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 755
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 757
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    .line 758
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 760
    :cond_1
    return-void
.end method

.method public getCommentText()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 682
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 683
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 685
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public hide()V
    .locals 2

    .prologue
    .line 434
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    invoke-direct {p0}, Lcom/vk/sharing/view/SharingView;->animateHide()V

    .line 446
    :goto_0
    return-void

    .line 437
    :cond_0
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vk/sharing/view/SharingView$5;

    invoke-direct {v1, p0}, Lcom/vk/sharing/view/SharingView$5;-><init>(Lcom/vk/sharing/view/SharingView;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method

.method public hideClearButton()V
    .locals 2

    .prologue
    .line 729
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchClearButton:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 730
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchClearButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 731
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 732
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    sget v1, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_END_SEARCH_INPUT_EMPTY:I

    invoke-static {v0, v1}, Lcom/vk/sharing/view/SharingView;->changeSearchInputEndMargin(Landroid/view/View;I)V

    .line 733
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v0, v1}, Lcom/vk/sharing/view/SharingView;->changeSearchInputEllipsize(Landroid/widget/TextView;Landroid/text/TextUtils$TruncateAt;)V

    .line 736
    :cond_0
    return-void
.end method

.method public hideContent()V
    .locals 2

    .prologue
    .line 528
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->contentContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 529
    sget v0, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_TOP_CONTENT:I

    invoke-direct {p0, v0}, Lcom/vk/sharing/view/SharingView;->changeFooterAnimatorTopMargin(I)V

    .line 530
    return-void
.end method

.method public hideFooter()V
    .locals 2

    .prologue
    .line 559
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->footerAnimator:Landroid/widget/ViewAnimator;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setVisibility(I)V

    .line 560
    return-void
.end method

.method public hideFooterAttachments()V
    .locals 2

    .prologue
    .line 610
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 611
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 613
    :cond_0
    return-void
.end method

.method public hideHeaderBackButton()V
    .locals 2

    .prologue
    .line 503
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->backButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 504
    sget v0, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_START_COMMON:I

    invoke-direct {p0, v0}, Lcom/vk/sharing/view/SharingView;->changeHeaderAnimatorStartMargin(I)V

    .line 505
    return-void
.end method

.method public hideHeaderSearchButton()V
    .locals 2

    .prologue
    .line 512
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 513
    return-void
.end method

.method public hideKeyboard()V
    .locals 3

    .prologue
    .line 676
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 677
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 678
    return-void
.end method

.method public isAnimating()Z
    .locals 1

    .prologue
    .line 473
    iget-boolean v0, p0, Lcom/vk/sharing/view/SharingView;->animating:Z

    return v0
.end method

.method public isSearchQueryEmpty()Z
    .locals 1

    .prologue
    .line 616
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isGraphic(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 252
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 256
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onSearchClick()V

    .line 259
    :cond_0
    return-void
.end method

.method synthetic lambda$new$2(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 286
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 287
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onRetryClick()V

    .line 289
    :cond_0
    return-void
.end method

.method synthetic lambda$new$3(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 305
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onOutsideClick()V

    .line 308
    :cond_0
    return-void
.end method

.method synthetic lambda$new$4(I)V
    .locals 1
    .param p1, "actionId"    # I

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0, p1}, Lcom/vk/sharing/view/SharingView$Presenter;->onActionClick(I)V

    .line 317
    :cond_0
    return-void
.end method

.method synthetic lambda$new$5(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 322
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onSendClick()V

    .line 325
    :cond_0
    return-void
.end method

.method synthetic lambda$showClearButton$6(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 716
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 717
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onClearClick()V

    .line 719
    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .prologue
    .line 330
    invoke-super {p0}, Landroid/widget/ScrollView;->onAttachedToWindow()V

    .line 331
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 332
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 363
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 364
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onBackClick()V

    .line 366
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 336
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 337
    invoke-super {p0}, Landroid/widget/ScrollView;->onDetachedFromWindow()V

    .line 338
    return-void
.end method

.method onHiddenKeyboard(I)V
    .locals 4
    .param p1, "keyboardHeight"    # I

    .prologue
    .line 353
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    neg-int v1, p1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 354
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-float v1, p1

    .line 355
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationYBy(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lcom/vk/core/util/AnimationUtils;->standartCurve:Landroid/support/v4/view/animation/FastOutSlowInInterpolator;

    .line 356
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xe1

    .line 357
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 358
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 359
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 360
    return-void
.end method

.method onOpenedKeyboard(I)V
    .locals 4
    .param p1, "keyboardHeight"    # I

    .prologue
    .line 341
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getHeight()I

    move-result v1

    if-gt v0, v1, :cond_0

    .line 342
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 343
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->bottomSheet:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    neg-int v1, p1

    int-to-float v1, v1

    .line 344
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationYBy(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lcom/vk/core/util/AnimationUtils;->decelerationCurve:Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;

    .line 345
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xe1

    .line 346
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 347
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 348
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 350
    :cond_0
    return-void
.end method

.method public scrollListToStart()V
    .locals 2

    .prologue
    .line 750
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 751
    return-void
.end method

.method public setActionsInfo(Lcom/vk/sharing/action/ActionsInfo;)V
    .locals 1
    .param p1, "actionsInfo"    # Lcom/vk/sharing/action/ActionsInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 377
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->actionsView:Lcom/vk/sharing/view/SharingActionsView;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/view/SharingActionsView;->setInfo(Lcom/vk/sharing/action/ActionsInfo;)V

    .line 378
    invoke-virtual {p1}, Lcom/vk/sharing/action/ActionsInfo;->haveComment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 379
    invoke-virtual {p1}, Lcom/vk/sharing/action/ActionsInfo;->getComment()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->predefinedComment:Ljava/lang/String;

    .line 381
    :cond_0
    return-void
.end method

.method public setAttachmentViewHolder(Lcom/vk/sharing/attachment/AttachmentViewHolder;)V
    .locals 0
    .param p1, "attachmentViewHolder"    # Lcom/vk/sharing/attachment/AttachmentViewHolder;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 373
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    .line 374
    return-void
.end method

.method public setEmptyText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 655
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->emptyView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 656
    const v0, 0x7f10019e

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->emptyView:Landroid/widget/TextView;

    .line 658
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->emptyView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 659
    return-void
.end method

.method public setErrorMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 702
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->errorView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 703
    const v0, 0x7f1001a1

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->errorView:Landroid/widget/TextView;

    .line 705
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->errorView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 706
    return-void
.end method

.method public setPresenter(Lcom/vk/sharing/view/SharingView$Presenter;)V
    .locals 0
    .param p1, "presenter"    # Lcom/vk/sharing/view/SharingView$Presenter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 369
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    .line 370
    return-void
.end method

.method public setSearchHint(Ljava/lang/String;)V
    .locals 1
    .param p1, "hint"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 696
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 697
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 699
    :cond_0
    return-void
.end method

.method public setSearchQuery(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 690
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 691
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 693
    :cond_0
    return-void
.end method

.method public setSendButtonCount(I)V
    .locals 2
    .param p1, "count"    # I

    .prologue
    .line 638
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButtonCounter:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 639
    const v0, 0x7f100349

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButtonCounter:Landroid/widget/TextView;

    .line 640
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButtonCounter:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 652
    :goto_0
    return-void

    .line 646
    :cond_0
    const/4 v0, 0x1

    if-gt p1, v0, :cond_1

    .line 647
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButtonCounter:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 649
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButtonCounter:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 650
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButtonCounter:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setSubtitle(Ljava/lang/String;)V
    .locals 2
    .param p1, "subtitle"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 629
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 630
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->subTitleView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 635
    :goto_0
    return-void

    .line 632
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->subTitleView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 633
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->subTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setTargets(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 384
    .local p1, "targets":Ljava/util/List;, "Ljava/util/List<Lcom/vk/sharing/target/Target;>;"
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView;->targets:Ljava/util/List;

    .line 385
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->adapter:Lcom/vk/sharing/view/SharingView$TargetsAdapter;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->notifyDataSetChanged()V

    .line 386
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 620
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 621
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->titleView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 626
    :goto_0
    return-void

    .line 623
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->titleView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 624
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public show()V
    .locals 2

    .prologue
    .line 393
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 394
    invoke-direct {p0}, Lcom/vk/sharing/view/SharingView;->animateShow()V

    .line 405
    :goto_0
    return-void

    .line 396
    :cond_0
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vk/sharing/view/SharingView$3;

    invoke-direct {v1, p0}, Lcom/vk/sharing/view/SharingView$3;-><init>(Lcom/vk/sharing/view/SharingView;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method

.method public showClearButton()V
    .locals 2

    .prologue
    .line 709
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchClearButton:Landroid/view/View;

    if-nez v0, :cond_2

    .line 710
    const v0, 0x7f10034e

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchClearButton:Landroid/view/View;

    .line 711
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchClearButton:Landroid/view/View;

    if-nez v0, :cond_1

    .line 726
    :cond_0
    :goto_0
    return-void

    .line 715
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchClearButton:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/sharing/view/SharingView$$Lambda$9;->lambdaFactory$(Lcom/vk/sharing/view/SharingView;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 721
    :cond_2
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchClearButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 722
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 723
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    sget v1, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_END_SEARCH_INPUT:I

    invoke-static {v0, v1}, Lcom/vk/sharing/view/SharingView;->changeSearchInputEndMargin(Landroid/view/View;I)V

    .line 724
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/sharing/view/SharingView;->changeSearchInputEllipsize(Landroid/widget/TextView;Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_0
.end method

.method public showContent()V
    .locals 2

    .prologue
    .line 523
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->contentContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 524
    sget v0, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_TOP_NO_CONTENT:I

    invoke-direct {p0, v0}, Lcom/vk/sharing/view/SharingView;->changeFooterAnimatorTopMargin(I)V

    .line 525
    return-void
.end method

.method public showError()V
    .locals 2

    .prologue
    .line 551
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->contentAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 552
    return-void
.end method

.method public showFooterActions()V
    .locals 2

    .prologue
    .line 555
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->footerAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 556
    return-void
.end method

.method public showFooterAttachments()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 594
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    if-nez v1, :cond_2

    .line 595
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    if-eqz v1, :cond_1

    .line 596
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/sharing/view/SharingView;->sendContainer:Landroid/widget/LinearLayout;

    invoke-interface {v1, v2, v3}, Lcom/vk/sharing/attachment/AttachmentViewHolder;->create(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    .line 597
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_0

    .line 598
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 599
    .local v0, "params":Landroid/widget/LinearLayout$LayoutParams;
    sget v1, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_START_ATTACHMENT:I

    sget v2, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_TOP_ATTACHMENT:I

    sget v3, Lcom/vk/sharing/view/SharingView;->FOOTER_MARGIN_TOP_ATTACHMENT:I

    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 600
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 602
    .end local v0    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->sendContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 607
    :cond_1
    :goto_0
    return-void

    .line 605
    :cond_2
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->attachmentView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public showFooterCancel()V
    .locals 2

    .prologue
    .line 586
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->footerAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 587
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->cancelButton:Landroid/view/View;

    if-nez v0, :cond_0

    .line 588
    const v0, 0x7f100345

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->cancelButton:Landroid/view/View;

    .line 589
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->cancelButton:Landroid/view/View;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->backClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 591
    :cond_0
    return-void
.end method

.method public showFooterSend()V
    .locals 2

    .prologue
    .line 563
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->footerAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 564
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    if-nez v0, :cond_1

    .line 565
    const v0, 0x7f100347

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    .line 566
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    if-nez v0, :cond_1

    .line 583
    :cond_0
    :goto_0
    return-void

    .line 572
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->predefinedComment:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->predefinedComment:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 573
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->predefinedComment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 574
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 579
    :goto_1
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButton:Landroid/view/View;

    if-nez v0, :cond_0

    .line 580
    const v0, 0x7f100348

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButton:Landroid/view/View;

    .line 581
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->sendButton:Landroid/view/View;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->sendClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 577
    :cond_2
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->commentInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lcom/vk/sharing/view/SharingView$$Lambda$8;->lambdaFactory$(Landroid/widget/EditText;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    goto :goto_1
.end method

.method public showHeaderBackButton()V
    .locals 2

    .prologue
    .line 498
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->backButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 499
    sget v0, Lcom/vk/sharing/view/SharingView;->HEADER_MARGIN_START_BACK_BUTTON:I

    invoke-direct {p0, v0}, Lcom/vk/sharing/view/SharingView;->changeHeaderAnimatorStartMargin(I)V

    .line 500
    return-void
.end method

.method public showHeaderCommon()V
    .locals 2

    .prologue
    .line 477
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->headerAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 478
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 479
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->searchInputWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 481
    :cond_0
    return-void
.end method

.method public showHeaderSearch()V
    .locals 2

    .prologue
    .line 484
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->headerAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 485
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-nez v0, :cond_0

    .line 486
    const v0, 0x7f10034d

    invoke-virtual {p0, v0}, Lcom/vk/sharing/view/SharingView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    .line 487
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    if-nez v0, :cond_0

    .line 495
    :goto_0
    return-void

    .line 492
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->searchInputWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 493
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->searchInputWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 494
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lcom/vk/sharing/view/SharingView$$Lambda$7;->lambdaFactory$(Landroid/widget/EditText;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public showHeaderSearchButton()V
    .locals 2

    .prologue
    .line 508
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->searchButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 509
    return-void
.end method

.method public showKeyboard()V
    .locals 1

    .prologue
    .line 662
    invoke-virtual {p0}, Lcom/vk/sharing/view/SharingView;->findFocus()Landroid/view/View;

    move-result-object v0

    .line 663
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 664
    invoke-direct {p0, v0}, Lcom/vk/sharing/view/SharingView;->showKeyboard(Landroid/view/View;)V

    .line 668
    :goto_0
    return-void

    .line 666
    :cond_0
    invoke-direct {p0, p0}, Lcom/vk/sharing/view/SharingView;->showKeyboard(Landroid/view/View;)V

    goto :goto_0
.end method

.method public showList()V
    .locals 2

    .prologue
    .line 543
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->targets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 544
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->contentAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 548
    :goto_0
    return-void

    .line 546
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->contentAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    goto :goto_0
.end method

.method public showLoading()V
    .locals 2

    .prologue
    .line 539
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->contentAnimator:Landroid/widget/ViewAnimator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 540
    return-void
.end method

.method public updateTargetAtPosition(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 389
    iget-object v1, p0, Lcom/vk/sharing/view/SharingView;->adapter:Lcom/vk/sharing/view/SharingView$TargetsAdapter;

    iget-object v0, p0, Lcom/vk/sharing/view/SharingView;->list:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/view/SharingView$TargetViewHolder;

    invoke-virtual {v1, v0, p1}, Lcom/vk/sharing/view/SharingView$TargetsAdapter;->onBindViewHolder(Lcom/vk/sharing/view/SharingView$TargetViewHolder;I)V

    .line 390
    return-void
.end method
