import { useEffect, useState } from 'react'
import './App.css'

interface Dataset {
  id: number
  name: string
  description: string
  tags: string
  last_updated: string
  record_count: number
  owner: string
  source: string
  is_public: boolean
  created_at: string
}

function App() {
  const [datasets, setDatasets] = useState<Dataset[]>([])
  const [search, setSearch] = useState("")
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    setLoading(true)
    const handler = setTimeout(() => {
      const url = search
        ? `http://localhost:8000/datasets?search=${encodeURIComponent(search)}`
        : `http://localhost:8000/datasets`
      fetch(url)
        .then(res => res.json())
        .then(data => setDatasets(data))
        .catch(err => console.error("Error fetching datasets:", err))
        .finally(() => setLoading(false))
    }, 1500)

    return () => clearTimeout(handler)
  }, [search])

  const filtered = datasets

  return (
    <div className="p-6" style={{ maxWidth: '1200px', margin: '0 auto' }}>
      <div className="mb-6">
        <h1 className="text-2xl font-bold mb-4">Mini Data Portal</h1>
        <input
          type="text"
          placeholder="Search datasets..."
          className="search-input"
          value={search}
          onChange={e => setSearch(e.target.value)}
        />
      </div>

      {loading ? (
        <div className="loading-spinner">
          <div className="spinner"></div>
          <div>Loading datasets...</div>
        </div>
      ) : (
        <div className="dataset-grid" style={{ paddingTop: '2rem' }}>
          {filtered.map(ds => (
            <div key={ds.id} className="dataset-card">
              <div className="dataset-header">
                <h2 className="dataset-title">{ds.name}</h2>
                <span className="dataset-source">Source: {ds.source}</span>
              </div>
              <p className="dataset-description">{ds.description}</p>
              <div className="dataset-records">Records: {ds.record_count.toLocaleString()}</div>
              <div className="dataset-meta">
                <span>Last updated: {new Date(ds.last_updated).toLocaleDateString()}</span>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}

export default App
