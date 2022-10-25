.class public Lcom/vkontakte/android/LinkSpan;
.super Landroid/text/style/CharacterStyle;
.source "LinkSpan.java"


# static fields
.field private static final DEFAULT_COLOR:I


# instance fields
.field private color:I

.field private link:Ljava/lang/String;

.field private final postInteract:Lcom/vkontakte/android/data/PostInteract;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f011b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    sput v0, Lcom/vkontakte/android/LinkSpan;->DEFAULT_COLOR:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "l"    # Ljava/lang/String;

    .prologue
    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 1
    .param p1, "l"    # Ljava/lang/String;
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    .line 16
    sget v0, Lcom/vkontakte/android/LinkSpan;->DEFAULT_COLOR:I

    iput v0, p0, Lcom/vkontakte/android/LinkSpan;->color:I

    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/LinkSpan;->link:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/vkontakte/android/LinkSpan;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 26
    return-void
.end method


# virtual methods
.method public getColor()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/vkontakte/android/LinkSpan;->color:I

    return v0
.end method

.method public getLink()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/LinkSpan;->link:Ljava/lang/String;

    return-object v0
.end method

.method public onClick(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 43
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vkontakte/android/LinkSpan;->link:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 44
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    iget-object v1, p0, Lcom/vkontakte/android/LinkSpan;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v1, :cond_0

    .line 46
    iget-object v1, p0, Lcom/vkontakte/android/LinkSpan;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    iget-object v2, p0, Lcom/vkontakte/android/LinkSpan;->link:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->setLink(Ljava/lang/String;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->link_click:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->sendNow(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 48
    :cond_0
    return-void
.end method

.method public setColor(I)V
    .locals 0
    .param p1, "c"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/vkontakte/android/LinkSpan;->color:I

    .line 30
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1, "tp"    # Landroid/text/TextPaint;

    .prologue
    .line 38
    iget v0, p0, Lcom/vkontakte/android/LinkSpan;->color:I

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 39
    return-void
.end method
