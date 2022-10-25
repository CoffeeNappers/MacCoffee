.class Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip$1;
.super Ljava/lang/Object;
.source "PagerSlidingTabStrip.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip$1;->this$0:Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 48
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 39
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip$1;->this$0:Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;

    invoke-static {v0, p1}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->access$000(Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;I)V

    .line 44
    return-void
.end method
