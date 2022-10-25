.class Lcom/vkontakte/android/fragments/HtmlGameFragment$5;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;->setupTheme()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 526
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$5;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 529
    new-instance v0, Landroid/support/v7/widget/PopupMenu;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$5;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 530
    .local v0, "menu":Landroid/support/v7/widget/PopupMenu;
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f10000f

    const v3, 0x7f080184

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 540
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$5;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 541
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->show()V

    .line 542
    return-void
.end method
