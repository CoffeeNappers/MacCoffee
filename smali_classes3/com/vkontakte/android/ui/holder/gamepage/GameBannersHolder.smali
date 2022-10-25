.class public Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameBannersHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final appsAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;

.field private final infiniteViewPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

.field private final visitSource:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 29
    const v0, 0x7f030031

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 30
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->visitSource:Ljava/lang/String;

    .line 32
    const v0, 0x7f10018c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->infiniteViewPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->infiniteViewPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->setOffscreenPageLimit(I)V

    .line 34
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;Lcom/vkontakte/android/ui/holder/RecyclerHolder;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->appsAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;

    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->infiniteViewPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    new-instance v1, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->appsAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;-><init>(Landroid/support/v4/view/PagerAdapter;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->visitSource:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getInfiniteViewPager()Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->infiniteViewPager:Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    return-object v0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 21
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->onBind(Ljava/util/ArrayList;)V

    return-void
.end method

.method public onBind(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p1, "item":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->appsAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder$AppsAdapter;->setApiApplications(Ljava/util/ArrayList;)V

    .line 41
    return-void
.end method
