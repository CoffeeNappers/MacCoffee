.class public final Lcom/vkontakte/android/ui/binder/LikeBarBinder;
.super Ljava/lang/Object;
.source "LikeBarBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;
    }
.end annotation


# instance fields
.field private formatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;

.field public likesContainer:Landroid/view/View;

.field public likesCounterView:Landroid/widget/TextView;

.field public likesLabelView:Landroid/widget/TextView;

.field public likesPhotoView:Lcom/vkontakte/android/ui/PhotoStripView;

.field public repostsCounterView:Landroid/widget/TextView;

.field public viewsCounterView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const v0, 0x7f1004c8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesContainer:Landroid/view/View;

    .line 43
    const v0, 0x7f1004c9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/PhotoStripView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesPhotoView:Lcom/vkontakte/android/ui/PhotoStripView;

    .line 44
    const v0, 0x7f1004ca

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesLabelView:Landroid/widget/TextView;

    .line 46
    const v0, 0x7f1004cb

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesCounterView:Landroid/widget/TextView;

    .line 47
    const v0, 0x7f1004cd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->viewsCounterView:Landroid/widget/TextView;

    .line 48
    const v0, 0x7f1004cc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->repostsCounterView:Landroid/widget/TextView;

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesPhotoView:Lcom/vkontakte/android/ui/PhotoStripView;

    const v1, 0x3f4ccccd    # 0.8f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setOverlapOffset(F)V

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesPhotoView:Lcom/vkontakte/android/ui/PhotoStripView;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setPadding(I)V

    .line 52
    return-void
.end method

.method static synthetic lambda$bind$0(Lcom/vkontakte/android/data/LikeInfo;)Ljava/lang/String;
    .locals 1
    .param p0, "like"    # Lcom/vkontakte/android/data/LikeInfo;

    .prologue
    .line 82
    const-string/jumbo v0, "photo"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/LikeInfo;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bind(ZZIIILjava/util/List;)V
    .locals 6
    .param p1, "liked"    # Z
    .param p2, "reposted"    # Z
    .param p3, "likeCount"    # I
    .param p4, "repostCount"    # I
    .param p5, "viewCount"    # I
    .param p6    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZIII",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p6, "likes":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/LikeInfo;>;"
    const/4 v5, 0x0

    const/16 v4, 0x8

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 55
    if-lez p3, :cond_2

    .line 56
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesCounterView:Landroid/widget/TextView;

    invoke-static {p3}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesCounterView:Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 62
    if-lez p4, :cond_3

    .line 63
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->repostsCounterView:Landroid/widget/TextView;

    invoke-static {p4}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->repostsCounterView:Landroid/widget/TextView;

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 69
    if-lez p5, :cond_4

    .line 70
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->viewsCounterView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 71
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->viewsCounterView:Landroid/widget/TextView;

    invoke-static {p5}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    :goto_2
    invoke-interface {p6}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesPhotoView:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/PhotoStripView;->size()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 77
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesPhotoView:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-interface {p6}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 80
    :cond_0
    invoke-interface {p6}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_7

    .line 81
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesContainer:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 82
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesPhotoView:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-static {}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-static {p6, v3}, Lcom/vkontakte/android/functions/Functions;->project(Ljava/util/List;Lcom/vkontakte/android/functions/F1;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/PhotoStripView;->load(Ljava/util/List;)V

    .line 83
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->formatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;

    if-nez v2, :cond_1

    .line 84
    new-instance v2, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;

    invoke-direct {v2}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->formatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;

    .line 86
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesLabelView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->formatter:Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;

    if-eqz p1, :cond_5

    move v2, v0

    :goto_3
    sub-int v2, p3, v2

    if-eqz p2, :cond_6

    :goto_4
    sub-int v0, p4, v0

    invoke-virtual {v4, v2, v0, p6}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$LikeLabelFormatter;->format(IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    :goto_5
    return-void

    .line 58
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesCounterView:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 65
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->repostsCounterView:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 73
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->viewsCounterView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    :cond_5
    move v2, v1

    .line 86
    goto :goto_3

    :cond_6
    move v0, v1

    goto :goto_4

    .line 88
    :cond_7
    iget-object v0, p0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesContainer:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5
.end method
