.class public Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;
.super Ljava/lang/Object;
.source "AutoSuggestStickersPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;
    }
.end annotation


# static fields
.field private static final POPUP_HEIGHT:I


# instance fields
.field private final mAnchorTextView:Landroid/widget/EditText;

.field private final mAnchorView:Landroid/view/View;

.field private final mContext:Landroid/content/Context;

.field private mData:Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

.field private mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

.field private mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

.field private mPopupShowing:Z

.field private mPopupWindow:Landroid/widget/PopupWindow;

.field private mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

.field private mViewToUrlProjection:Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 50
    sget v0, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_AUTOSUGGEST_ITEM_SIZE:I

    const/high16 v1, 0x41e00000    # 28.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    add-int/2addr v0, v1

    sput v0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->POPUP_HEIGHT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "editText"    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "anchorView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-boolean v2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupShowing:Z

    .line 58
    new-instance v0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$1;-><init>(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;)V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mViewToUrlProjection:Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;

    .line 71
    const-string/jumbo v0, "AutoSuggestWindow"

    const-string/jumbo v1, "Create instance"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    .line 75
    iput-object p2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mAnchorTextView:Landroid/widget/EditText;

    .line 77
    iput-object p3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mAnchorView:Landroid/view/View;

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mAnchorTextView:Landroid/widget/EditText;

    new-instance v1, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$2;-><init>(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 145
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/stickers/Stickers;->reloadAutoSuggestDictionaryIfNeeded(Z)V

    .line 146
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mData:Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    return-object v0
.end method

.method private initializePopupWindow()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v5, -0x1

    const/4 v4, -0x2

    const/4 v10, 0x0

    .line 155
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    if-eqz v6, :cond_1

    .line 203
    :cond_0
    :goto_0
    return-void

    .line 159
    :cond_1
    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 160
    .local v2, "padding":I
    const/high16 v6, 0x40a00000    # 5.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .line 161
    .local v3, "paddingLeftRight":I
    new-instance v6, Lcom/vkontakte/android/stickers/WindowRecyclerView;

    iget-object v7, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Lcom/vkontakte/android/stickers/WindowRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    .line 162
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    iget-object v7, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mViewToUrlProjection:Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->init(Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;)V

    .line 163
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    const/high16 v7, 0x41900000    # 18.0f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v6, v3, v2, v3, v7}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setPadding(IIII)V

    .line 165
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    new-instance v7, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$3;

    invoke-direct {v7, p0, v3}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$3;-><init>(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;I)V

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 175
    new-instance v1, Lcom/vkontakte/android/stickers/CalloutPopupBackgroundDrawable;

    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    const v7, 0x7f0200b9

    .line 176
    invoke-static {v6, v7}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    const v8, 0x7f0200b8

    .line 177
    invoke-static {v7, v8}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    const v9, 0x7f0200ba

    .line 178
    invoke-static {v8, v9}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-direct {v1, v6, v7, v8}, Lcom/vkontakte/android/stickers/CalloutPopupBackgroundDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 180
    .local v1, "mCalloutDrawable":Lcom/vkontakte/android/stickers/CalloutPopupBackgroundDrawable;
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v6, v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 181
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    new-instance v7, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v8, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8, v10, v10}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 183
    new-instance v6, Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    iget-object v7, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Lcom/vkontakte/android/stickers/LeftDeltaLayout;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    .line 184
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    new-instance v7, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v7, v5, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/stickers/LeftDeltaLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    iget-object v7, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/stickers/LeftDeltaLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 186
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    invoke-virtual {v6, v1}, Lcom/vkontakte/android/stickers/LeftDeltaLayout;->setCalloutPopupBackgroundDrawable(Lcom/vkontakte/android/stickers/CalloutPopupBackgroundDrawable;)V

    .line 187
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    iget-object v7, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f090021

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    invoke-virtual {v6, v7, v10, v10, v10}, Lcom/vkontakte/android/stickers/LeftDeltaLayout;->setPadding(IIII)V

    .line 189
    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    .line 190
    .local v0, "isTablet":Z
    if-eqz v0, :cond_2

    .line 191
    .local v4, "widthMode":I
    :goto_1
    new-instance v5, Landroid/widget/PopupWindow;

    iget-object v6, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    sget v7, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->POPUP_HEIGHT:I

    invoke-direct {v5, v6, v4, v7, v10}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v5, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 193
    iget-object v5, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    const v6, 0x1030002

    invoke-virtual {v5, v6}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 195
    if-eqz v0, :cond_0

    .line 198
    iget-object v5, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v5, v11}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 199
    iget-object v5, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v5, v11}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 201
    iget-object v5, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    new-instance v6, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v5, v6}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .end local v4    # "widthMode":I
    :cond_2
    move v4, v5

    .line 190
    goto :goto_1
.end method


# virtual methods
.method public hidePopup()V
    .locals 1

    .prologue
    .line 247
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->showHidePopupWindow(Lcom/vkontakte/android/data/orm/StickersDictionaryItem;)V

    .line 248
    return-void
.end method

.method public setListener(Lcom/vkontakte/android/stickers/StickersView$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/stickers/StickersView$Listener;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 152
    return-void
.end method

.method public showHidePopupWindow(Lcom/vkontakte/android/data/orm/StickersDictionaryItem;)V
    .locals 9
    .param p1, "autoSuggestStickers"    # Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 206
    iput-object p1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mData:Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    .line 208
    if-nez p1, :cond_1

    .line 209
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupShowing:Z

    if-eqz v3, :cond_0

    .line 210
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v3}, Landroid/widget/PopupWindow;->dismiss()V

    .line 211
    iput-boolean v7, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupShowing:Z

    .line 244
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    const/4 v3, 0x2

    new-array v2, v3, [I

    .line 215
    .local v2, "location":[I
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mAnchorTextView:Landroid/widget/EditText;

    invoke-virtual {v3, v2}, Landroid/widget/EditText;->getLocationOnScreen([I)V

    .line 216
    const-string/jumbo v3, "AutoSuggestPopup"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Anchor location  x = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v2, v7

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", y = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v2, v8

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    if-nez v3, :cond_2

    .line 219
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->initializePopupWindow()V

    .line 222
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mLeftDeltaLayout:Lcom/vkontakte/android/stickers/LeftDeltaLayout;

    aget v4, v2, v7

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090021

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/stickers/LeftDeltaLayout;->setDelta(I)V

    .line 225
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v3

    instance-of v3, v3, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    if-eqz v3, :cond_3

    .line 226
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    .line 227
    .local v0, "adapter":Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;
    invoke-static {v0, p1}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->access$102(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;Lcom/vkontakte/android/data/orm/StickersDictionaryItem;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    .line 228
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-static {v0, v3}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->access$202(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;Lcom/vkontakte/android/stickers/StickersView$Listener;)Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 229
    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;->notifyDataSetChanged()V

    .line 235
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mAnchorView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupShowing:Z

    if-nez v3, :cond_0

    .line 238
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_4

    const/16 v1, 0x33

    .line 239
    .local v1, "gravity":I
    :goto_2
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupWindow:Landroid/widget/PopupWindow;

    iget-object v4, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mAnchorView:Landroid/view/View;

    aget v5, v2, v8

    sget v6, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->POPUP_HEIGHT:I

    sub-int/2addr v5, v6

    const/high16 v6, 0x41800000    # 16.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v3, v4, v1, v7, v5}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 240
    iput-boolean v8, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mPopupShowing:Z

    goto/16 :goto_0

    .line 231
    .end local v0    # "adapter":Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;
    .end local v1    # "gravity":I
    :cond_3
    new-instance v0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-direct {v0, p1, v3}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;-><init>(Lcom/vkontakte/android/data/orm/StickersDictionaryItem;Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    .line 232
    .restart local v0    # "adapter":Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$Adapter;
    iget-object v3, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->mStickersRecyclerView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_1

    .line 238
    :cond_4
    const/16 v1, 0x30

    goto :goto_2
.end method
