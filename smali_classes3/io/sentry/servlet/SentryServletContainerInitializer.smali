.class public Lio/sentry/servlet/SentryServletContainerInitializer;
.super Ljava/lang/Object;
.source "SentryServletContainerInitializer.java"

# interfaces
.implements Ljavax/servlet/ServletContainerInitializer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStartup(Ljava/util/Set;Ljavax/servlet/ServletContext;)V
    .locals 1
    .param p2, "ctx"    # Ljavax/servlet/ServletContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;",
            "Ljavax/servlet/ServletContext;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .prologue
    .line 14
    .local p1, "c":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    const-class v0, Lio/sentry/servlet/SentryServletRequestListener;

    invoke-interface {p2, v0}, Ljavax/servlet/ServletContext;->addListener(Ljava/lang/Class;)V

    .line 15
    return-void
.end method
