.class public Lcom/vkontakte/android/ui/MentionSpan;
.super Landroid/text/style/ForegroundColorSpan;
.source "MentionSpan.java"


# static fields
.field private static final DEFAULT_COLOR:I


# instance fields
.field public id:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 11
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0f011b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/MentionSpan;->DEFAULT_COLOR:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    sget v0, Lcom/vkontakte/android/ui/MentionSpan;->DEFAULT_COLOR:I

    invoke-direct {p0, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(Landroid/os/Parcel;)V

    .line 22
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/MentionSpan;->id:I

    .line 23
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 27
    invoke-super {p0, p1, p2}, Landroid/text/style/ForegroundColorSpan;->writeToParcel(Landroid/os/Parcel;I)V

    .line 28
    iget v0, p0, Lcom/vkontakte/android/ui/MentionSpan;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 29
    return-void
.end method
