.class public Lcom/vkontakte/android/ui/Font$TypefaceSpan;
.super Landroid/text/style/MetricAffectingSpan;
.source "Font.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/Font;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TypefaceSpan"
.end annotation


# instance fields
.field private mColor:Ljava/lang/Integer;

.field private mTypeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/Font;)V
    .locals 1
    .param p1, "font"    # Lcom/vkontakte/android/ui/Font;

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/text/style/MetricAffectingSpan;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mColor:Ljava/lang/Integer;

    .line 46
    iget-object v0, p1, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mTypeface:Landroid/graphics/Typeface;

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/ui/Font;I)V
    .locals 1
    .param p1, "font"    # Lcom/vkontakte/android/ui/Font;
    .param p2, "color"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/Font$TypefaceSpan;-><init>(Lcom/vkontakte/android/ui/Font;)V

    .line 54
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mColor:Ljava/lang/Integer;

    .line 55
    return-void
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1, "tp"    # Landroid/text/TextPaint;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mColor:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mColor:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 76
    :cond_1
    invoke-virtual {p1}, Landroid/text/TextPaint;->getFlags()I

    move-result v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setFlags(I)V

    .line 77
    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1, "p"    # Landroid/text/TextPaint;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mColor:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/ui/Font$TypefaceSpan;->mColor:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 65
    :cond_1
    invoke-virtual {p1}, Landroid/text/TextPaint;->getFlags()I

    move-result v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setFlags(I)V

    .line 66
    return-void
.end method
