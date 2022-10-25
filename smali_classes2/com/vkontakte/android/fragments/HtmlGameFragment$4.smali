.class Lcom/vkontakte/android/fragments/HtmlGameFragment$4;
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
    .line 518
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$4;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 521
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$4;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 522
    return-void
.end method
