.class Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "NotificationPostDisplayItemGallery.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;
.implements Lcom/vkontakte/android/ui/ActivityResulter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/UserNotification;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/view/ViewTreeObserver$OnPreDrawListener;",
        "Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;",
        "Lcom/vkontakte/android/ui/ActivityResulter;"
    }
.end annotation


# instance fields
.field private adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

.field final button:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private galleryDescriptionContainer:Landroid/widget/LinearLayout;

.field final imageView:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private linearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field final message:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field final profileViews:[Lcom/vk/imageloader/view/VKImageView;

.field final profilesDescription:Landroid/widget/TextView;

.field final publisher:Lcom/vkontakte/android/utils/PostPublisher;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private rvGallery:Landroid/support/v7/widget/RecyclerView;

.field private selectionContext:Lcom/vk/attachpicker/SelectionContext;

.field style:I

.field final title:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 13
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "viewType"    # I

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 136
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v5}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 133
    iput v10, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    .line 137
    new-instance v5, Lcom/vkontakte/android/utils/PostPublisher;

    new-instance v6, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$1;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$1;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/utils/PostPublisher;-><init>(Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;)V

    iput-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->publisher:Lcom/vkontakte/android/utils/PostPublisher;

    .line 152
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->itemView:Landroid/view/View;

    new-instance v6, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 166
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->itemView:Landroid/view/View;

    check-cast v3, Landroid/widget/LinearLayout;

    .line 167
    .local v3, "layout":Landroid/widget/LinearLayout;
    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 168
    invoke-virtual {v3, p0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 170
    invoke-static {p2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->getButtonStyle(I)I

    move-result v2

    .line 172
    .local v2, "buttonStyle":I
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget-object v6, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->HEADERS:[I

    invoke-static {p2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->getStyle(I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    aget v6, v6, v7

    invoke-virtual {v5, v6, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 174
    invoke-static {p2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->hasUsers(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 175
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f030184

    invoke-virtual {v5, v6, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 178
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget-object v6, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->BUTTONS:[I

    aget v6, v6, v2

    invoke-virtual {v5, v6, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 179
    .local v0, "button":Landroid/view/View;
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 181
    if-eq v2, v8, :cond_1

    if-ne v2, v11, :cond_2

    .line 182
    :cond_1
    iget v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    packed-switch v5, :pswitch_data_0

    .line 197
    .end local v0    # "button":Landroid/view/View;
    :cond_2
    :goto_0
    const v5, 0x1020016

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->title:Landroid/widget/TextView;

    .line 198
    const v5, 0x1020019

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->button:Landroid/widget/TextView;

    if-eqz v5, :cond_3

    .line 199
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->button:Landroid/widget/TextView;

    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    :cond_3
    const v5, 0x102000b

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    .line 202
    iget v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    if-ne v5, v12, :cond_4

    .line 203
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->configureNewPost(Landroid/content/Context;)V

    .line 205
    :cond_4
    const v5, 0x1020006

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vk/imageloader/view/VKImageView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 206
    const v5, 0x7f100439

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profilesDescription:Landroid/widget/TextView;

    .line 207
    const/4 v5, 0x4

    new-array v5, v5, [Lcom/vk/imageloader/view/VKImageView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profileViews:[Lcom/vk/imageloader/view/VKImageView;

    .line 208
    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profileViews:[Lcom/vk/imageloader/view/VKImageView;

    const v5, 0x7f100435

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vk/imageloader/view/VKImageView;

    aput-object v5, v6, v10

    .line 209
    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profileViews:[Lcom/vk/imageloader/view/VKImageView;

    const v5, 0x7f100436

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vk/imageloader/view/VKImageView;

    aput-object v5, v6, v8

    .line 210
    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profileViews:[Lcom/vk/imageloader/view/VKImageView;

    const v5, 0x7f100437

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vk/imageloader/view/VKImageView;

    aput-object v5, v6, v11

    .line 211
    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profileViews:[Lcom/vk/imageloader/view/VKImageView;

    const v5, 0x7f100438

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vk/imageloader/view/VKImageView;

    aput-object v5, v6, v12

    .line 213
    const v5, 0x1020027

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    .line 214
    .local v1, "buttonClose":Landroid/view/View;
    if-eqz v1, :cond_5

    .line 215
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    :cond_5
    return-void

    .line 184
    .end local v1    # "buttonClose":Landroid/view/View;
    .restart local v0    # "button":Landroid/view/View;
    :pswitch_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090027

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const/high16 v6, 0x42980000    # 76.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    add-int v4, v5, v6

    .line 185
    .local v4, "leftPad":I
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    goto/16 :goto_0

    .line 188
    .end local v4    # "leftPad":I
    :pswitch_1
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090027

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const/high16 v6, 0x42300000    # 44.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    add-int v4, v5, v6

    .line 189
    .restart local v4    # "leftPad":I
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    goto/16 :goto_0

    .line 192
    .end local v4    # "leftPad":I
    :pswitch_2
    check-cast v0, Landroid/widget/LinearLayout;

    .end local v0    # "button":Landroid/view/View;
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto/16 :goto_0

    .line 182
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->checkBtnPublishPost()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vk/attachpicker/SelectionContext;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method private checkBtnPublishPost()V
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 260
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    if-nez v4, :cond_0

    .line 266
    :goto_0
    return-void

    .line 263
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    move v1, v2

    .line 264
    .local v1, "isTextNotEmpty":Z
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v4}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v4

    if-lez v4, :cond_4

    move v0, v2

    .line 265
    .local v0, "isSelected":Z
    :goto_2
    if-nez v1, :cond_1

    if-eqz v0, :cond_2

    :cond_1
    move v3, v2

    :cond_2
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->setBtnPublishPost(Z)V

    goto :goto_0

    .end local v0    # "isSelected":Z
    .end local v1    # "isTextNotEmpty":Z
    :cond_3
    move v1, v3

    .line 263
    goto :goto_1

    .restart local v1    # "isTextNotEmpty":Z
    :cond_4
    move v0, v3

    .line 264
    goto :goto_2
.end method

.method private configureNewPost(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 277
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    if-nez v1, :cond_0

    .line 313
    :goto_0
    return-void

    .line 280
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->setBtnPublishPost(Z)V

    .line 281
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    new-instance v2, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$4;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$4;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 296
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    new-instance v2, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$5;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$5;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 308
    const v1, 0x7f100430

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    .line 309
    .local v0, "userInfoView":Landroid/view/View;
    if-eqz v0, :cond_1

    .line 310
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 312
    :cond_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->setupRecyclerView(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private loadMediaStore()V
    .locals 2

    .prologue
    .line 248
    const/16 v0, 0xde

    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->load(ILcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V

    .line 257
    return-void
.end method

.method private loadPhotosInside()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 355
    invoke-static {}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhoto()Ljava/util/ArrayList;

    move-result-object v0

    .line 356
    .local v0, "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 357
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->showGallery(Z)V

    .line 358
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->setImages(Ljava/util/List;)V

    .line 362
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->loadMediaStore()V

    .line 363
    return-void

    .line 360
    :cond_0
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->showGallery(Z)V

    goto :goto_0
.end method

.method private setBtnPublishPost(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->button:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 274
    :goto_0
    return-void

    .line 272
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->button:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 273
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->button:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    goto :goto_0

    :cond_1
    const v0, 0x3f19999a    # 0.6f

    goto :goto_1
.end method

.method private setupRecyclerView(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    if-nez v0, :cond_0

    .line 221
    new-instance v0, Lcom/vk/attachpicker/SelectionContext;

    invoke-direct {v0}, Lcom/vk/attachpicker/SelectionContext;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vk/attachpicker/SelectionContext$SelectionCallback;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/SelectionContext;->setSelectListener(Lcom/vk/attachpicker/SelectionContext$SelectionCallback;)V

    .line 224
    :cond_0
    const v0, 0x7f100433

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->galleryDescriptionContainer:Landroid/widget/LinearLayout;

    .line 225
    const v0, 0x7f100432

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    .line 226
    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->showGallery(Z)V

    .line 227
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v0, p1, v2, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->linearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->linearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 230
    new-instance v0, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-direct {v0, p1, v1, v2}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Z)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 233
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    new-instance v1, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$3;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$3;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->setItemClickListener(Lcom/vk/attachpicker/widget/OnItemClickListener;)V

    .line 244
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->loadPhotosInside()V

    .line 245
    return-void
.end method

.method private showCurrentUserProfile(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 316
    new-instance v1, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/UserNotification;

    invoke-direct {v1, v3}, Lcom/vkontakte/android/NewsEntry;-><init>(Lcom/vkontakte/android/data/UserNotification;)V

    .line 317
    .local v1, "newsEntry":Lcom/vkontakte/android/NewsEntry;
    new-instance v2, Lcom/vkontakte/android/data/PostInteract;

    const-string/jumbo v3, ""

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    .line 318
    .local v2, "postInteract":Lcom/vkontakte/android/data/PostInteract;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    .line 319
    .local v0, "id":I
    new-instance v3, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-direct {v3, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v3, v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->setFromPost(II)Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 320
    sget-object v3, Lcom/vkontakte/android/data/PostInteract$Type;->open_user:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 321
    return-void
.end method

.method private showGallery(Z)V
    .locals 3
    .param p1, "show"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 345
    if-eqz p1, :cond_0

    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->galleryDescriptionContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 347
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 352
    :goto_0
    return-void

    .line 349
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->galleryDescriptionContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 350
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    .locals 8
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 424
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->linearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v5}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    .line 425
    .local v0, "firstPosition":I
    sub-int v4, p1, v0

    .line 426
    .local v4, "wantedChild":I
    if-ltz v4, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v5

    if-lt v4, v5, :cond_2

    .line 427
    :cond_0
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "GalleryFragment"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "Unable to getTexture imageView for desired position, because it\'s not being displayed on screen."

    aput-object v7, v5, v6

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 444
    :cond_1
    :goto_0
    return-object v2

    .line 430
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5, v4}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .local v3, "view":Landroid/view/View;
    move-object v1, v3

    .line 431
    check-cast v1, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;

    .line 432
    .local v1, "imageView":Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;
    if-eqz v1, :cond_1

    .line 433
    new-instance v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    invoke-direct {v2}, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;-><init>()V

    .line 434
    .local v2, "object":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    iput-object v1, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    .line 435
    iput-object v3, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    .line 436
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->rvGallery:Landroid/support/v7/widget/RecyclerView;

    iput-object v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->parentView:Landroid/view/View;

    .line 437
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->getStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v5

    iput-object v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 438
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->hasImage()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 439
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->getImageWidth()I

    move-result v5

    iput v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageWidth:I

    .line 440
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->getImageHeight()I

    move-result v5

    iput v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageHeight:I

    goto :goto_0
.end method

.method synthetic lambda$loadMediaStore$1(Ljava/util/ArrayList;)V
    .locals 3
    .param p1, "mediaStore"    # Ljava/util/ArrayList;

    .prologue
    const/4 v2, 0x0

    .line 249
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 250
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->showGallery(Z)V

    .line 251
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->setImages(Ljava/util/List;)V

    .line 256
    :goto_0
    return-void

    .line 253
    :cond_0
    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->showGallery(Z)V

    .line 254
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->adapter:Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->setImages(Ljava/util/List;)V

    goto :goto_0
.end method

.method synthetic lambda$setupRecyclerView$0(I)V
    .locals 0
    .param p1, "countSelected"    # I

    .prologue
    .line 222
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->checkBtnPublishPost()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 472
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 473
    .local v0, "a":Landroid/app/Activity;
    if-nez v0, :cond_1

    .line 499
    :cond_0
    :goto_0
    return-void

    .line 476
    :cond_1
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 477
    new-instance v1, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    invoke-static {v0, p3, v1}, Lcom/vk/core/util/IntentUtils;->handleResult(Landroid/app/Activity;Landroid/content/Intent;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/data/UserNotification;)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/data/UserNotification;

    .prologue
    const/high16 v5, 0x42800000    # 64.0f

    const/high16 v4, 0x42000000    # 32.0f

    .line 367
    iget v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 368
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->title:Landroid/widget/TextView;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 369
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 370
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/data/UserNotification;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 379
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->button:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/data/UserNotification;->buttonText:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 380
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profilesDescription:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/data/UserNotification;->profileDescription:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 381
    iget-object v2, p1, Lcom/vkontakte/android/data/UserNotification;->profiles:Ljava/util/ArrayList;

    if-eqz v2, :cond_3

    .line 382
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profileViews:[Lcom/vk/imageloader/view/VKImageView;

    array-length v2, v2

    iget-object v3, p1, Lcom/vkontakte/android/data/UserNotification;->profiles:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 383
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->profileViews:[Lcom/vk/imageloader/view/VKImageView;

    aget-object v3, v2, v0

    iget-object v2, p1, Lcom/vkontakte/android/data/UserNotification;->profiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 382
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 373
    .end local v0    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/data/UserNotification;->title:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 374
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    if-eqz v2, :cond_2

    .line 375
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 377
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/data/UserNotification;->message:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    goto :goto_0

    .line 387
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-nez v2, :cond_4

    .line 408
    :goto_2
    return-void

    .line 390
    :cond_4
    iget v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    packed-switch v2, :pswitch_data_0

    goto :goto_2

    .line 392
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {p1, v3, v4}, Lcom/vkontakte/android/data/UserNotification;->findImageUrl(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_2

    .line 395
    :pswitch_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {p1, v3, v4}, Lcom/vkontakte/android/data/UserNotification;->findImageUrl(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_2

    .line 398
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/UserNotification;

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/UserNotification;->findImage(I)Lcom/vkontakte/android/Image;

    move-result-object v1

    .line 399
    .local v1, "image":Lcom/vkontakte/android/Image;
    if-eqz v1, :cond_5

    .line 400
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget v3, v1, Lcom/vkontakte/android/Image;->w:I

    int-to-float v3, v3

    iget v4, v1, Lcom/vkontakte/android/Image;->h:I

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(FF)V

    .line 402
    :cond_5
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_2

    .line 405
    .end local v1    # "image":Lcom/vkontakte/android/Image;
    :pswitch_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_2

    .line 390
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 103
    check-cast p1, Lcom/vkontakte/android/data/UserNotification;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->onBind(Lcom/vkontakte/android/data/UserNotification;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 325
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 342
    :goto_0
    return-void

    .line 327
    :sswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->showCurrentUserProfile(Landroid/content/Context;)V

    goto :goto_0

    .line 330
    :sswitch_1
    iget v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    .line 331
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->publisher:Lcom/vkontakte/android/utils/PostPublisher;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    if-nez v0, :cond_0

    move-object v0, v1

    .line 332
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    if-nez v4, :cond_1

    .line 331
    :goto_2
    invoke-virtual {v2, v3, v0, v1}, Lcom/vkontakte/android/utils/PostPublisher;->publishPost(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->message:Landroid/widget/TextView;

    .line 332
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    .line 333
    invoke-virtual {v1}, Lcom/vk/attachpicker/SelectionContext;->getSelectionPaths()Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_2

    .line 335
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/UserNotification;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/UserNotification;->forceAction(Landroid/content/Context;)V

    goto :goto_0

    .line 339
    :sswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/UserNotification;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/UserNotification;->forceClose(Landroid/content/Context;)V

    goto :goto_0

    .line 325
    nop

    :sswitch_data_0
    .sparse-switch
        0x1020019 -> :sswitch_1
        0x1020027 -> :sswitch_2
        0x7f100430 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPhotoSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 0
    .param p1, "imageEntry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 468
    return-void
.end method

.method public onPhotoSwitch(II)V
    .locals 4
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .prologue
    .line 451
    const/4 v2, -0x1

    if-ne p1, v2, :cond_1

    .line 464
    :cond_0
    :goto_0
    return-void

    .line 455
    :cond_1
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v1

    .line 456
    .local v1, "oldObject":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    if-eqz v1, :cond_2

    .line 457
    iget-object v2, v1, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 460
    :cond_2
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v0

    .line 461
    .local v0, "newObject":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    if-eqz v0, :cond_0

    .line 462
    iget-object v2, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public onPreDraw()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 412
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-nez v0, :cond_1

    .line 419
    :cond_0
    :goto_0
    return v4

    .line 415
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 416
    iget v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    instance-of v0, v0, Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 417
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/UserNotification;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->getWidth()I

    move-result v2

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/data/UserNotification;->findImageUrl(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_0
.end method
