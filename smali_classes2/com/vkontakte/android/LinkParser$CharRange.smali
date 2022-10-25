.class Lcom/vkontakte/android/LinkParser$CharRange;
.super Ljava/lang/Object;
.source "LinkParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/LinkParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CharRange"
.end annotation


# instance fields
.field end:I

.field start:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "s"    # I
    .param p2, "e"    # I

    .prologue
    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    iput p1, p0, Lcom/vkontakte/android/LinkParser$CharRange;->start:I

    .line 221
    iput p2, p0, Lcom/vkontakte/android/LinkParser$CharRange;->end:I

    .line 222
    return-void
.end method
