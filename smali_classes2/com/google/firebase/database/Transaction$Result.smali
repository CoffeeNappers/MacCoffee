.class public Lcom/google/firebase/database/Transaction$Result;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/database/Transaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field private aZC:Z

.field private aZD:Lcom/google/android/gms/internal/zzaml;


# direct methods
.method private constructor <init>(ZLcom/google/android/gms/internal/zzaml;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/google/firebase/database/Transaction$Result;->aZC:Z

    iput-object p2, p0, Lcom/google/firebase/database/Transaction$Result;->aZD:Lcom/google/android/gms/internal/zzaml;

    return-void
.end method

.method synthetic constructor <init>(ZLcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/Transaction$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/database/Transaction$Result;-><init>(ZLcom/google/android/gms/internal/zzaml;)V

    return-void
.end method


# virtual methods
.method public isSuccess()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/database/Transaction$Result;->aZC:Z

    return v0
.end method

.method public zzcqy()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/Transaction$Result;->aZD:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method
