.class Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "MenuListView.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BirthdayViewHolder"
.end annotation


# instance fields
.field private counter:Landroid/widget/TextView;

.field private counter2:Landroid/widget/TextView;

.field private icon:Landroid/widget/ImageView;

.field private photos:Lcom/vkontakte/android/ui/PhotoStripView;

.field private text:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 5

    .prologue
    .line 1319
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 1320
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0300ee

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1321
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10036f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->icon:Landroid/widget/ImageView;

    .line 1322
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->icon:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0201ea

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0f0119

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1323
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100370

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->text:Landroid/widget/TextView;

    .line 1324
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100371

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter:Landroid/widget/TextView;

    .line 1325
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100372

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter2:Landroid/widget/TextView;

    .line 1326
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100374

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/PhotoStripView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    .line 1327
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setPadding(I)V

    .line 1328
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-static {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;)Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setListener(Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;)V

    .line 1329
    return-void
.end method


# virtual methods
.method public applyExpansion()V
    .locals 8

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f000000    # 0.5f

    .line 1369
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->icon:Landroid/widget/ImageView;

    const/high16 v4, -0x3e400000    # -24.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v5

    sub-float v5, v7, v5

    mul-float/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 1370
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const/high16 v4, -0x3db00000    # -52.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v5

    sub-float v5, v7, v5

    mul-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/PhotoStripView;->setTranslationX(F)V

    .line 1371
    const v3, 0x3f333333    # 0.7f

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v4

    const v5, 0x3e99999a    # 0.3f

    mul-float/2addr v4, v5

    add-float v2, v3, v4

    .line 1372
    .local v2, "scale":F
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->setScaleX(F)V

    .line 1373
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->setScaleY(F)V

    .line 1374
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v4

    mul-float/2addr v4, v6

    add-float/2addr v4, v6

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/PhotoStripView;->setOverlapOffset(F)V

    .line 1375
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v4

    sub-float/2addr v4, v6

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    div-float/2addr v3, v6

    const/high16 v4, 0x437f0000    # 255.0f

    mul-float/2addr v3, v4

    float-to-int v0, v3

    .line 1376
    .local v0, "ba":I
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const/4 v4, 0x2

    invoke-virtual {v3, v4, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setBitmapAlpha(II)V

    .line 1377
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    const/4 v4, 0x3

    invoke-virtual {v3, v4, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setBitmapAlpha(II)V

    .line 1378
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v3

    const v4, 0x3e4ccccd    # 0.2f

    div-float/2addr v3, v4

    invoke-static {v7, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    sub-float v1, v7, v3

    .line 1379
    .local v1, "countersAlpha":F
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter2:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 1380
    return-void
.end method

.method public bind()V
    .locals 6

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x0

    .line 1332
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 1333
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1334
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->load(ILjava/lang/String;)V

    .line 1333
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1337
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->text:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 1338
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->text:Landroid/widget/TextView;

    invoke-static {}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2500()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1340
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2200(Lcom/vkontakte/android/ui/widget/MenuListView;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1341
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_3

    .line 1342
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter2:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1343
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter2:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1347
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x4

    if-le v1, v2, :cond_4

    .line 1348
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1349
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1353
    :goto_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->applyExpansion()V

    .line 1355
    :cond_2
    return-void

    .line 1345
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter2:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 1351
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->counter:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2
.end method

.method synthetic lambda$new$0(Lcom/vkontakte/android/ui/PhotoStripView;I)V
    .locals 2
    .param p1, "view"    # Lcom/vkontakte/android/ui/PhotoStripView;
    .param p2, "index"    # I

    .prologue
    .line 1328
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 1359
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    const v1, -0x77359400

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onMenuItemSelected(IZ)V

    .line 1360
    return-void
.end method

.method public onLongClick()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1364
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    const v1, -0x77359400

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onMenuItemSelected(IZ)V

    .line 1365
    return v2
.end method
