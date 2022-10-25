.class public Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
.super Ljava/lang/Object;
.source "RecyclerSectionAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public decoratorType:I

.field public final object:Ljava/lang/Object;

.field public final type:I


# direct methods
.method public constructor <init>(ILjava/lang/Object;)V
    .locals 1
    .param p1, "type"    # I
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;-><init>(ILjava/lang/Object;I)V

    .line 32
    return-void
.end method

.method private constructor <init>(ILjava/lang/Object;I)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "decoratorType"    # I

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p1, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->type:I

    .line 26
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    .line 27
    iput p3, p0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->decoratorType:I

    .line 28
    return-void
.end method

.method public static bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
    .locals 2
    .param p0, "type"    # I
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 47
    new-instance v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    const/4 v1, 0x4

    invoke-direct {v0, p0, p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;-><init>(ILjava/lang/Object;I)V

    return-object v0
.end method

.method public static middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
    .locals 2
    .param p0, "type"    # I
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 35
    new-instance v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;-><init>(ILjava/lang/Object;I)V

    return-object v0
.end method

.method public static none(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
    .locals 1
    .param p0, "type"    # I
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 39
    new-instance v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;-><init>(ILjava/lang/Object;)V

    return-object v0
.end method

.method public static top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
    .locals 2
    .param p0, "type"    # I
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 43
    new-instance v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;-><init>(ILjava/lang/Object;I)V

    return-object v0
.end method

.method public static topBottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
    .locals 2
    .param p0, "type"    # I
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 51
    new-instance v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    const/4 v1, 0x6

    invoke-direct {v0, p0, p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;-><init>(ILjava/lang/Object;I)V

    return-object v0
.end method
