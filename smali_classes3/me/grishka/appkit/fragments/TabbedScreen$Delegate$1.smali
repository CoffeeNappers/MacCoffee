.class Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;
.super Ljava/lang/Object;
.source "TabbedScreen.java"

# interfaces
.implements Landroid/support/design/widget/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/grishka/appkit/fragments/TabbedScreen$Delegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;


# direct methods
.method constructor <init>(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)V
    .locals 0
    .param p1, "this$0"    # Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    .prologue
    .line 82
    iput-object p1, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabReselected(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 0
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 104
    return-void
.end method

.method public onTabSelected(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 4
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 85
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v1

    .line 86
    .local v1, "pos":I
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-static {v2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->access$000(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Lme/grishka/appkit/views/DisableableViewPager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lme/grishka/appkit/views/DisableableViewPager;->setCurrentItem(I)V

    .line 87
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-static {v2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->access$100(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 88
    .local v0, "f":Landroid/app/Fragment;
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-static {v2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->access$200(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Z

    move-result v2

    if-eqz v2, :cond_0

    instance-of v2, v0, Lme/grishka/appkit/fragments/LoaderFragment;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-static {v2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->access$300(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_0

    move-object v2, v0

    check-cast v2, Lme/grishka/appkit/fragments/LoaderFragment;

    iget-boolean v2, v2, Lme/grishka/appkit/fragments/LoaderFragment;->loaded:Z

    if-nez v2, :cond_0

    .line 89
    check-cast v0, Lme/grishka/appkit/fragments/LoaderFragment;

    .end local v0    # "f":Landroid/app/Fragment;
    invoke-virtual {v0}, Lme/grishka/appkit/fragments/LoaderFragment;->loadData()V

    .line 90
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-static {v2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->access$300(Lme/grishka/appkit/fragments/TabbedScreen$Delegate;)Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 92
    :cond_0
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v2, v1}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->onPageSelected(I)V

    .line 93
    iget-object v2, p0, Lme/grishka/appkit/fragments/TabbedScreen$Delegate$1;->this$0:Lme/grishka/appkit/fragments/TabbedScreen$Delegate;

    invoke-virtual {v2}, Lme/grishka/appkit/fragments/TabbedScreen$Delegate;->invalidateOptionsMenu()V

    .line 94
    return-void
.end method

.method public onTabUnselected(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 0
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 99
    return-void
.end method
