.class Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "MenuListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SectionViewHolder"
.end annotation


# instance fields
.field index:I

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 4

    .prologue
    .line 1207
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 1208
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0300f6

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1209
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v2, -0x1

    const/high16 v3, 0x42600000    # 56.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1210
    return-void
.end method


# virtual methods
.method public applyExpansion()V
    .locals 5

    .prologue
    .line 1221
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    .line 1222
    .local v0, "txt":Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v2, 0x437f0000    # 255.0f

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    shl-int/lit8 v2, v2, 0x18

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1223
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->itemView:Landroid/view/View;

    iget v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->index:I

    mul-int/lit8 v2, v2, 0x28

    int-to-float v2, v2

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    neg-int v2, v2

    int-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v4

    sub-float/2addr v3, v4

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 1224
    return-void
.end method

.method public bind(Ljava/lang/String;I)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "i"    # I

    .prologue
    .line 1213
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1214
    iput p2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->index:I

    .line 1215
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2200(Lcom/vkontakte/android/ui/widget/MenuListView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1216
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->applyExpansion()V

    .line 1218
    :cond_0
    return-void
.end method
