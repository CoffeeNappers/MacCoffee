.class Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;
.super Landroid/webkit/WebViewClient;
.source "WikiViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/WikiViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V
    .locals 0

    .prologue
    .line 275
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Lcom/vkontakte/android/fragments/WikiViewFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/WikiViewFragment$1;

    .prologue
    .line 275
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "wv"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 303
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$900(Lcom/vkontakte/android/fragments/WikiViewFragment;)V

    .line 304
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 11
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    .line 277
    const-string/jumbo v6, "file://"

    const-string/jumbo v7, "https://vkontakte.ru"

    invoke-virtual {p2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 279
    :try_start_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 280
    .local v5, "uri":Landroid/net/Uri;
    const-string/jumbo v6, "vkontakte.ru"

    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string/jumbo v6, "vk.com"

    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string/jumbo v6, "m.vk.com"

    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 281
    :cond_0
    const-string/jumbo v6, "/pages"

    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 282
    const-string/jumbo v6, "oid"

    invoke-virtual {v5, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 283
    .local v2, "oid":I
    const-string/jumbo v6, "p"

    invoke-virtual {v5, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x5f

    const/16 v8, 0x20

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 284
    .local v4, "title":Ljava/lang/String;
    const-string/jumbo v6, "vk"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "page \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\' "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    iget-object v6, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    const/4 v7, 0x1

    invoke-static {v6, v2, v4, v7}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$700(Lcom/vkontakte/android/fragments/WikiViewFragment;ILjava/lang/String;Z)V

    .line 299
    .end local v2    # "oid":I
    .end local v4    # "title":Ljava/lang/String;
    .end local v5    # "uri":Landroid/net/Uri;
    :goto_0
    return v10

    .line 287
    .restart local v5    # "uri":Landroid/net/Uri;
    :cond_1
    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "/page[-0-9]+_[0-9]+"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 288
    const-string/jumbo v6, "/page([-0-9]+)_([0-9]+)"

    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 289
    .local v3, "ptn":Ljava/util/regex/Pattern;
    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 290
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    .line 291
    iget-object v6, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x2

    invoke-virtual {v1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    invoke-static {v6, v7, v8, v9}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$800(Lcom/vkontakte/android/fragments/WikiViewFragment;IIZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 295
    .end local v1    # "m":Ljava/util/regex/Matcher;
    .end local v3    # "ptn":Ljava/util/regex/Pattern;
    .end local v5    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v6

    .line 297
    :cond_2
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "vklink://view/?"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 298
    .local v0, "intent":Landroid/content/Intent;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
