.class Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "StickerPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickerPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderHolder"
.end annotation


# static fields
.field private static final ID:I = -0x1


# instance fields
.field private mActionCallback:Landroid/view/View$OnClickListener;

.field private mError:Landroid/view/View;

.field private mItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

.field private mOkButton:Landroid/view/View;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mRoot:Landroid/widget/RelativeLayout;

.field private mStickerButton:Landroid/widget/TextView;

.field private mSubtitle:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickerPage;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/stickers/StickerPage;Landroid/content/Context;)V
    .locals 5
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 212
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    .line 213
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030201

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 205
    invoke-static {p0}, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mActionCallback:Landroid/view/View$OnClickListener;

    .line 215
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->itemView:Landroid/view/View;

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mRoot:Landroid/widget/RelativeLayout;

    .line 216
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mRoot:Landroid/widget/RelativeLayout;

    const v2, 0x7f100544

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mStickerButton:Landroid/widget/TextView;

    .line 217
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mRoot:Landroid/widget/RelativeLayout;

    const v2, 0x7f100546

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mOkButton:Landroid/view/View;

    .line 218
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mRoot:Landroid/widget/RelativeLayout;

    const v2, 0x7f100545

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mProgress:Landroid/widget/ProgressBar;

    .line 219
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mRoot:Landroid/widget/RelativeLayout;

    const v2, 0x7f100547

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mError:Landroid/view/View;

    .line 220
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mRoot:Landroid/widget/RelativeLayout;

    const v2, 0x7f100128

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mTitle:Landroid/widget/TextView;

    .line 221
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mRoot:Landroid/widget/RelativeLayout;

    const v2, 0x7f10019c

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mSubtitle:Landroid/widget/TextView;

    .line 223
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mStickerButton:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mActionCallback:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    new-instance v0, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    invoke-direct {v0, v4}, Lcom/vkontakte/android/ui/CircularProgressDrawable;-><init>(Z)V

    .line 226
    .local v0, "pd":Lcom/vkontakte/android/ui/CircularProgressDrawable;
    const v1, -0xae7e48

    invoke-virtual {v0, v4, v1}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setColors(II)V

    .line 227
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setThickness(F)V

    .line 228
    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setPad(Z)V

    .line 229
    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->setDimBackground(Z)V

    .line 230
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 231
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mTitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->author:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mItem:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mStickerButton:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mOkButton:Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mProgress:Landroid/widget/ProgressBar;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->mError:Landroid/view/View;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;->bindButtons(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/widget/TextView;Landroid/view/View;Landroid/widget/ProgressBar;Landroid/view/View;)V

    .line 239
    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    const-string/jumbo v1, "keyboard"

    iput-object v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$200(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/PurchasesManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/PurchasesManager;->purchase(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 210
    return-void
.end method

.method synthetic lambda$null$0(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 1
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickerPage;->reload(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 209
    return-void
.end method
