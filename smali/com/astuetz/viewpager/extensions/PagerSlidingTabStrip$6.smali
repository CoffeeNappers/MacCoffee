.class Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$6;
.super Ljava/lang/Object;
.source "PagerSlidingTabStrip.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addDrawableTab(ILcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    .prologue
    .line 425
    iput-object p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$6;->this$0:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    iput p2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$6;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 428
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$6;->this$0:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    invoke-static {v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->access$100(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v0

    iget v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$6;->val$position:I

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 429
    return-void
.end method
