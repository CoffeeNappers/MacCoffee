.class Lcom/google/android/gms/internal/zzakz$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzakz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzakz;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzakz$zza",
        "<TT;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic bhb:Lcom/google/android/gms/internal/zzakz;

.field final synthetic bhc:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzakz;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzakz$2;->bhb:Lcom/google/android/gms/internal/zzakz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzakz$2;->bhc:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p3, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzakz$2;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "TT;",
            "Ljava/lang/Void;",
            ")",
            "Ljava/lang/Void;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz$2;->bhc:Ljava/util/List;

    new-instance v1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-direct {v1, p1, p2}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    return-object v0
.end method
