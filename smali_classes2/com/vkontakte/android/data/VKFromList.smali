.class public Lcom/vkontakte/android/data/VKFromList;
.super Ljava/util/ArrayList;
.source "VKFromList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/ArrayList",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private from:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 12
    .local p0, "this":Lcom/vkontakte/android/data/VKFromList;, "Lcom/vkontakte/android/data/VKFromList<TT;>;"
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/vkontakte/android/data/VKFromList;->from:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public from()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    .local p0, "this":Lcom/vkontakte/android/data/VKFromList;, "Lcom/vkontakte/android/data/VKFromList<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/data/VKFromList;->from:Ljava/lang/String;

    return-object v0
.end method
