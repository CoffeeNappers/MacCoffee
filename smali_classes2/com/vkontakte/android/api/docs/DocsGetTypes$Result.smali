.class public Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;
.super Ljava/lang/Object;
.source "DocsGetTypes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/docs/DocsGetTypes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public canAdd:Z

.field public docTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;",
            ">;"
        }
    .end annotation
.end field

.field public docs:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
