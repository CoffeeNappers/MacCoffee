.class public Lcom/vkontakte/android/audio/http/ResponseException;
.super Ljava/io/IOException;
.source "ResponseException.java"


# instance fields
.field private final mStatusCode:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "statusCode"    # I

    .prologue
    .line 10
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 11
    iput p2, p0, Lcom/vkontakte/android/audio/http/ResponseException;->mStatusCode:I

    .line 12
    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .locals 1

    .prologue
    .line 15
    iget v0, p0, Lcom/vkontakte/android/audio/http/ResponseException;->mStatusCode:I

    return v0
.end method
