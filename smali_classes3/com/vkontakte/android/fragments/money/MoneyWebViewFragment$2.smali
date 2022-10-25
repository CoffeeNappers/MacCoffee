.class Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$2;
.super Landroid/webkit/WebChromeClient;
.source "MoneyWebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 155
    const/16 v0, 0x64

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->dataLoaded()V

    .line 158
    :cond_0
    return-void
.end method
