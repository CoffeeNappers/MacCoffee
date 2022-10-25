.class public Lcom/vkontakte/android/fragments/WikiViewFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "WikiViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;,
        Lcom/vkontakte/android/fragments/WikiViewFragment$HistoryEntry;,
        Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;,
        Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;,
        Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    }
.end annotation


# instance fields
.field private curMeta:Landroid/os/Bundle;

.field private injectedScript:Z

.field private shareActionProvider:Landroid/widget/ShareActionProvider;

.field private toolbarProgress:Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 95
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->injectedScript:Z

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/WikiViewFragment;)Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->toolbarProgress:Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/WikiViewFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->injectedScript:Z

    return v0
.end method

.method static synthetic access$1102(Lcom/vkontakte/android/fragments/WikiViewFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 47
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->injectedScript:Z

    return p1
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/WikiViewFragment;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->curMeta:Landroid/os/Bundle;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/WikiViewFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->displayPage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/WikiViewFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/WikiViewFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/WikiViewFragment;ILjava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Z

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadPage(ILjava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/WikiViewFragment;IIZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # Z

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadPage(IIZ)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/WikiViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->injectScript()V

    return-void
.end method

.method private displayPage(Ljava/lang/String;)V
    .locals 1
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 271
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->injectedScript:Z

    .line 272
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 273
    return-void
.end method

.method private doLoadPage(Lcom/vkontakte/android/api/pages/PagesGetHTML;Z)V
    .locals 2
    .param p1, "req"    # Lcom/vkontakte/android/api/pages/PagesGetHTML;
    .param p2, "useHistory"    # Z

    .prologue
    .line 203
    new-instance v0, Lcom/vkontakte/android/fragments/WikiViewFragment$1;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/fragments/WikiViewFragment$1;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Landroid/app/Fragment;)V

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/api/pages/PagesGetHTML;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 212
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 213
    return-void
.end method

.method private injectScript()V
    .locals 3

    .prologue
    .line 228
    const-string/jumbo v0, "javascript:{var phts=document.getElementsByClassName(\'al_photo\');var phUrls=[];for(var i=0;i<phts.length;i++){phUrls.push(phts[i].getElementsByTagName(\'img\')[0].attributes[\'data-src_big\'].value);phts[i].setAttribute(\'data-index\', i);phts[i].onclick=function(){window.vknative.openPhotos(phUrls, parseInt(this.attributes[\'data-index\'].value));return false;}}var auds={oids:[], aids:[], durations:[], artists:[], titles:[], urls:[]};var adivs=document.getElementsByClassName(\'audio_item\');for(var i=0;i<adivs.length;i++){auds.oids.push(parseInt(adivs[i].attributes[\'data-id\'].value.split(\'_\')[0]));auds.aids.push(parseInt(adivs[i].attributes[\'data-id\'].value.split(\'_\')[1]));auds.durations.push(parseInt(adivs[i].getElementsByClassName(\'ai_dur\')[0].attributes[\'data-dur\'].value));auds.artists.push(adivs[i].getElementsByClassName(\'ai_artist\')[0].innerText);auds.titles.push(adivs[i].getElementsByClassName(\'ai_title\')[0].innerText);auds.urls.push(adivs[i].getElementsByTagName(\'input\')[0].value);adivs[i].setAttribute(\'data-index\', i);adivs[i].onclick=function(){window.vknative.playAudio(auds.oids, auds.aids, auds.artists, auds.titles, auds.urls, auds.durations, parseInt(this.attributes[\'data-index\'].value));return false;}}void(0);};"

    .line 256
    .local v0, "script":Ljava/lang/String;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Injecting script!"

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 258
    return-void
.end method

.method private loadNote(II)V
    .locals 2
    .param p1, "oid"    # I
    .param p2, "nid"    # I

    .prologue
    .line 216
    new-instance v0, Lcom/vkontakte/android/api/pages/NotesGetById;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/pages/NotesGetById;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/WikiViewFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/WikiViewFragment$2;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V

    .line 217
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/pages/NotesGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 224
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 225
    return-void
.end method

.method private loadPage()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 180
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "oid"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_0

    .line 181
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v4}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadPage(Ljava/lang/String;Z)V

    .line 187
    :goto_0
    return-void

    .line 182
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "pid"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_1

    .line 183
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "oid"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "title"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, v4}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadPage(ILjava/lang/String;Z)V

    goto :goto_0

    .line 185
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "oid"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "pid"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-direct {p0, v0, v1, v4}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadPage(IIZ)V

    goto :goto_0
.end method

.method private loadPage(IIZ)V
    .locals 4
    .param p1, "oid"    # I
    .param p2, "id"    # I
    .param p3, "useHistory"    # Z

    .prologue
    .line 199
    new-instance v0, Lcom/vkontakte/android/api/pages/PagesGetHTML;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "site"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-direct {v0, p1, p2, v1}, Lcom/vkontakte/android/api/pages/PagesGetHTML;-><init>(IIZ)V

    invoke-direct {p0, v0, p3}, Lcom/vkontakte/android/fragments/WikiViewFragment;->doLoadPage(Lcom/vkontakte/android/api/pages/PagesGetHTML;Z)V

    .line 200
    return-void
.end method

.method private loadPage(ILjava/lang/String;Z)V
    .locals 1
    .param p1, "oid"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "useHistory"    # Z

    .prologue
    .line 194
    new-instance v0, Lcom/vkontakte/android/api/pages/PagesGetHTML;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/pages/PagesGetHTML;-><init>(ILjava/lang/String;)V

    invoke-direct {p0, v0, p3}, Lcom/vkontakte/android/fragments/WikiViewFragment;->doLoadPage(Lcom/vkontakte/android/api/pages/PagesGetHTML;Z)V

    .line 195
    return-void
.end method

.method private loadPage(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "useHistory"    # Z

    .prologue
    .line 190
    new-instance v0, Lcom/vkontakte/android/api/pages/PagesGetHTML;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/pages/PagesGetHTML;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/fragments/WikiViewFragment;->doLoadPage(Lcom/vkontakte/android/api/pages/PagesGetHTML;Z)V

    .line 191
    return-void
.end method


# virtual methods
.method protected doLoadData()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 167
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "nid"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "oid"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "nid"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadNote(II)V

    .line 172
    :goto_0
    return-void

    .line 170
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadPage()V

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 100
    const v1, 0x7f0300fa

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->setLayout(I)V

    .line 101
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 102
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->setHasOptionsMenu(Z)V

    .line 103
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadData()V

    .line 105
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 106
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "refer"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "refer":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 108
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "site"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 109
    const-string/jumbo v1, "open_layer"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "ref"

    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 115
    .end local v0    # "refer":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 111
    .restart local v0    # "refer":Ljava/lang/String;
    :cond_1
    const-string/jumbo v1, "open_wiki"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "ref"

    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    goto :goto_0
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 336
    const/4 v0, 0x1

    .line 338
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 157
    new-instance v0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebClient;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Lcom/vkontakte/android/fragments/WikiViewFragment$1;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebChrome;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Lcom/vkontakte/android/fragments/WikiViewFragment$1;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$WebCallback;-><init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Lcom/vkontakte/android/fragments/WikiViewFragment$1;)V

    const-string/jumbo v2, "vknative"

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v3, 0x0

    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "site"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 120
    const v1, 0x7f1002c9

    const v2, 0x7f0806fd

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 121
    .local v0, "item":Landroid/view/MenuItem;
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 122
    const v1, 0x7f020021

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 124
    .end local v0    # "item":Landroid/view/MenuItem;
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 128
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f1002c9

    if-ne v1, v2, :cond_0

    .line 129
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->curMeta:Landroid/os/Bundle;

    const-string/jumbo v2, "url"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "url":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/vk/sharing/Sharing;->share(Landroid/content/Context;Ljava/lang/String;)V

    .line 140
    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 176
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->loadData()V

    .line 177
    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 146
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 150
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WikiViewFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 152
    const v0, 0x7f100385

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment;->toolbarProgress:Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    .line 153
    return-void
.end method
