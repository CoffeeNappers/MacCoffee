.class public Lru/mail/libverify/utils/ClientException;
.super Ljava/lang/Exception;


# instance fields
.field private final a:Z


# direct methods
.method public constructor <init>(Ljava/io/IOException;)V
    .locals 1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lru/mail/libverify/utils/ClientException;->a:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lru/mail/libverify/utils/ClientException;->a:Z

    return-void
.end method
